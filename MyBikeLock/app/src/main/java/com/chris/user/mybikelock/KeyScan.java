package com.chris.user.mybikelock;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanResult;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Semaphore;

public class KeyScan extends AppCompatActivity {

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

        if(KeyScan.this.getSharedPreferences("mybikelock", MODE_PRIVATE)
                .getString("MAC", "").equals(""))
        {
            show("register lock first!!");
            finish();
        }

        this.requestPermissions(new String[]{Manifest.permission.ACCESS_COARSE_LOCATION,
                Manifest.permission.ACCESS_FINE_LOCATION},0);

        setContentView(R.layout.activity_key_scan);
        manager = (BluetoothManager)this.getSystemService(BLUETOOTH_SERVICE);
        adapter = manager.getAdapter();

        if(adapter == null){
            Toast.makeText(getBaseContext(), "no BLE hardware. exit...", Toast.LENGTH_SHORT).show();
            finish();
            return;
        }

        scanner = adapter.getBluetoothLeScanner();
        BLEs = (ListView) this.findViewById(R.id.BLEs_key);
        deviceName = new ArrayList<>();
        deviceList = new ArrayList<>();
        listAdapter = new ArrayAdapter<>(getBaseContext(), android.R.layout.simple_expandable_list_item_1, deviceName);
        System.out.println(listAdapter);
        System.out.println(BLEs);
        BLEs.setAdapter(listAdapter);
        BLEs.setOnItemClickListener(new KeyScan.onItemClickListener());
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
            Toast.makeText(KeyScan.this, "Start Scan", Toast.LENGTH_SHORT).show();
        }
    }

    public void stopScan(View view)
    {
        if(mScanning)
        {
            mScanning = false;
            scanner.stopScan(callback);
            Toast.makeText(KeyScan.this, "Stop Scan", Toast.LENGTH_SHORT).show();
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
                Toast.makeText(KeyScan.this, msg,
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
                BluetoothGatt gatt = device.connectGatt(KeyScan.this, false,
                        new KeyScan.GattCallBack(), 2);
                gatt.connect();
                stopScan(null);
            }
            catch(Exception ex)
            {
                Toast.makeText(KeyScan.this, ex.getMessage(), Toast.LENGTH_SHORT);
            }
        }
    }

    class GattCallBack extends BluetoothGattCallback {
        private Semaphore semaphore = new Semaphore(1);
        private byte[] output;

        @Override
        public void onConnectionStateChange(BluetoothGatt gatt, final int status, int newState) {
            show("connection state change : " + status + " " + newState);

            if (status == BluetoothGatt.GATT_SUCCESS) {
                if (newState == BluetoothProfile.STATE_CONNECTED) {
                    gatt.discoverServices();
                } else {
                    gatt.close();
                }
            }

            if (newState == BluetoothProfile.STATE_CONNECTED) {
                System.out.println("hahaha");
            } else {
                System.out.println("nonono");
            }
        }

        @Override
        public void onServicesDiscovered(final BluetoothGatt gatt, final int status) {
            String service_UUID = "00000001-70a9-4ef5-a742-3f273f7dc943";
            String char_UUID = "00000002-70a9-4ef5-a742-3f273f7dc943";
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
                                write(gatt, ch, "rockyou");
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
                                    throw new Exception("key not available");
                                }
                                else if(!in.equals("ACK"))
                                {
                                    throw new Exception("unknown response : " + in);
                                }

                                String password = PasswordManager.getInstance(null).getPassword();
                                password += password.substring(0, 16 - password.length());
                                write(gatt, ch, password);

                                in = read(gatt, ch);
                                if(!in.equals("ACK"))
                                {
                                    throw new Exception("unknown response : " + in);
                                }

                                String MAC = KeyScan.this.getSharedPreferences("mybikelock", MODE_PRIVATE)
                                        .getString("MAC", "");
                                write(gatt, ch, MAC);

                                in = read(gatt, ch);
                                if(!in.equals("ACK"))
                                {
                                    throw new Exception("unknown response : " + in);
                                }

                                show("successful key initialization");
                            }
                            catch (final Exception ex) {
                                show(ex.getMessage());
                            }
                            finally {
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
                System.out.println("get : " + ret);
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
