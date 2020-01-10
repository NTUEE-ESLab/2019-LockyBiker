package com.chris.user.mybikelock;

import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanResult;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Toast;
import android.Manifest;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.Semaphore;

public class LockScan extends AppCompatActivity {

    private ListView BLEs;
    private ArrayList<String> deviceName;
    private ArrayList<BluetoothDevice> deviceList;
    private ListAdapter listAdapter;
    private boolean mScanning=false;

    private BluetoothManager manager;
    private BluetoothAdapter adapter;
    private BluetoothLeScanner scanner;
    private static final int REQUEST_ENABLE_BT = 1;
    private static final int SCAN_TIME = 10000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        this.requestPermissions(new String[]{Manifest.permission.ACCESS_COARSE_LOCATION,
                Manifest.permission.ACCESS_FINE_LOCATION},0);

        setContentView(R.layout.activity_lock_scan);
        manager = (BluetoothManager)this.getSystemService(BLUETOOTH_SERVICE);
        adapter = manager.getAdapter();

        if(adapter == null){
            Toast.makeText(getBaseContext(), "no BLE hardware. exit...", Toast.LENGTH_SHORT).show();
            finish();
            return;
        }

        scanner = adapter.getBluetoothLeScanner();
        BLEs = (ListView)findViewById(R.id.BLEs);
        deviceName = new ArrayList<String>();
        deviceList = new ArrayList<BluetoothDevice>();
        listAdapter = new ArrayAdapter<String>(getBaseContext(), android.R.layout.simple_expandable_list_item_1, deviceName);//ListView使用的Adapter
        BLEs.setAdapter(listAdapter);//將listView綁上Adapter
        BLEs.setOnItemClickListener(new onItemClickListener()); //綁上OnItemClickListener，設定ListView點擊觸發事件
    }

    public void startScan(View view)
    {
        if(!mScanning)
        {
            deviceList.clear();
            deviceName.clear();
            ((BaseAdapter) listAdapter).notifyDataSetChanged(); //使用notifyDataSetChanger()更新listAdapter的內容
            mScanning = true;
            scanner.startScan(callback);
            Toast.makeText(LockScan.this, "Start Scan", Toast.LENGTH_SHORT).show();
        }
    }

    public void stopScan(View view)
    {
        if(mScanning)
        {
            mScanning = false;
            scanner.stopScan(callback);
            Toast.makeText(LockScan.this, "Stop Scan", Toast.LENGTH_SHORT).show();
        }
    }

    private ScanCallback callback = new ScanCallback()
    {
        @Override
        public void onBatchScanResults (List<ScanResult> results)
        {
            for(ScanResult s : results)
            {
                onScanResult(1, s);
            }
        }

        @Override
        public void onScanResult(int callbackType, ScanResult result)
        {
            BluetoothDevice d = result.getDevice();
            if (!deviceList.contains(d) && d.getName() != null)
            {
                deviceList.add(d);
                deviceName.add(d.getName() + " : " + d.getAddress());
                ((BaseAdapter)listAdapter).notifyDataSetChanged(); //使用notifyDataSetChanger()更新listAdapter的內容
            }
        }
    };

    private void show(final String msg)
    {
        System.out.println(msg);
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Toast.makeText(LockScan.this, msg,
                        Toast.LENGTH_SHORT).show();
            }
        });
    }

    private class onItemClickListener implements AdapterView.OnItemClickListener
    {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id)
        {
            BluetoothDevice device = deviceList.get(position);
            try
            {
                BluetoothGatt gatt = device.connectGatt(LockScan.this, false,
                        new GattCallBack(device.getAddress()));
                gatt.connect();
                stopScan(null);
            }
            catch(Exception ex)
            {
                Toast.makeText(LockScan.this, ex.getMessage(), Toast.LENGTH_SHORT);
            }
        }
    }

    class GattCallBack extends BluetoothGattCallback {
        private Semaphore semaphore = new Semaphore(1);
        private byte[] output;
        final String MAC;

        GattCallBack(String MAC) { this.MAC = MAC; }

        @Override
        public void onConnectionStateChange(BluetoothGatt gatt, final int status, int newState) {
            show("connection state change : " + status);

            if (status == BluetoothGatt.GATT_SUCCESS) {
                if (newState == BluetoothProfile.STATE_CONNECTED) {
                    gatt.discoverServices();
                } else {
                    gatt.close();
                }
            }
        }

        @Override
        public void onServicesDiscovered(final BluetoothGatt gatt, final int status) {
            String service_UUID = "f0001130-0451-4000-b000-000000000000";
            String char_UUID = "f0001131-0451-4000-b000-000000000000";
            try {
                BluetoothGattService service = gatt.getService(UUID.fromString(service_UUID));
                final BluetoothGattCharacteristic ch = service.getCharacteristic(UUID.fromString(char_UUID));
                System.out.println("get characteristic");
                if (ch != null) {
                    ch.setWriteType(BluetoothGattCharacteristic.WRITE_TYPE_NO_RESPONSE);

                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            try
                            {
                                String in;
                                write(gatt, ch, "fuckyou");
                                in = read(gatt, ch);
                                int count = 0;
                                while(in.equals("WAIT") && (count++) < 160) {
                                    System.out.println(count + "th wait");
                                    Thread.sleep(2);
                                    in = read(gatt, ch);
                                }
                                if(count == 160)
                                    throw new Exception("time out");

                                if(in.equals("NAK"))
                                {
                                    throw new Exception("lock not available");
                                }
                                else if(!in.equals("ACK"))
                                {
                                    throw new Exception("unknown response : " + in);
                                }

                                Random rand = new Random();
                                String password = PasswordManager.getInstance(null).getPassword();
                                password += password.substring(0, 16 - password.length());
                                String seed = Long.toBinaryString(rand.nextLong());

                                write(gatt, ch, password + seed);

                                in = read(gatt, ch);
                                if(!in.equals("OK"))
                                {
                                    throw new Exception("unknown response : " + in);
                                }
                                show("successful lock initialization");
                                LockScan.this.getSharedPreferences("mybikelock", MODE_PRIVATE).edit()
                                        .putString("MAC", MAC)
                                        .apply();
                            }
                            catch (final Exception ex) {
                                show(ex.getMessage());
                                gatt.close();
                            }
                        }
                    }).start();

                } else {
                    throw new Exception("fail to create connection.'");
                }
            } catch (final Exception ex) {
                show(ex.getMessage());
                gatt.close();
            }
        }

        @Override
        public void onCharacteristicWrite(final BluetoothGatt gatt,
                                          final BluetoothGattCharacteristic characteristic,
                                          final int status) {
            System.out.println("write callback(" + status + ") : ");
            System.out.flush();
            if (status != BluetoothGatt.GATT_SUCCESS) {
                characteristic.setValue(output);
                gatt.writeCharacteristic(characteristic);
            } else {
                semaphore.release();
            }
        }

        @Override
        public void onCharacteristicRead(final BluetoothGatt gatt,
                                          final BluetoothGattCharacteristic characteristic,
                                          final int status) {
            System.out.print("read callback(" + status + ") : ");
            for (byte i : characteristic.getValue()) System.out.print(i + " ");
            System.out.println(" = " + new String(characteristic.getValue()));
            if (status != BluetoothGatt.GATT_SUCCESS) {
                gatt.readCharacteristic(characteristic);
            } else {
                semaphore.release();
            }
        }

        private String read(BluetoothGatt gatt, BluetoothGattCharacteristic ch)
        {
            try
            {
                semaphore.acquire();
                gatt.readCharacteristic(ch);
                semaphore.acquire();
                String ret = new String(ch.getValue());
                semaphore.release();
                return ret;
            }
            catch(final Exception ex)
            {
                show(ex.getMessage());
                return "";
            }
        }

        private void write(BluetoothGatt gatt, BluetoothGattCharacteristic ch, final String message)
        {
            try
            {
                semaphore.acquire();
                System.out.println("writing " + message);
                ch.setValue(message);
                output = message.getBytes();
                gatt.writeCharacteristic(ch);
            }
            catch(final Exception ex)
            {
                show(ex.getMessage());
            }
        }
    }
}
