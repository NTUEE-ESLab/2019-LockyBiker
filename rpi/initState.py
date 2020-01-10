import dbus

from advertisement import Advertisement
from service import Application, Service, Characteristic
import RPi.GPIO as GPIO
import io

GATT_CHRC_IFACE = "org.bluez.GattCharacteristic1"
NOTIFY_TIMEOUT = 5000

BTN_CHANGE = 17
INIT_ACTIVATE = 0
INIT_DISABLED = 1
button_state = INIT_DISABLED

class BLEAdvertisement(Advertisement):
    def __init__(self, index):
        Advertisement.__init__(self, index, "peripheral")
        self.add_local_name("anonymousKUO.com")
        self.include_tx_power = True

class BLEService(Service):
    THERMOMETER_SVC_UUID = "00000001-70a9-4ef5-a742-3f273f7dc943"

    def __init__(self, index, buf):
        Service.__init__(self, index, self.THERMOMETER_SVC_UUID, True)
        self.add_characteristic(BLECharacteristic(self, buf))

STATE_IDLE = 0
STATE_WAIT_PASSWORD = 1
STATE_WAIT_MAC = 2

class BLECharacteristic(Characteristic):
    BLE_CHARACTERISTIC_UUID = "00000002-70a9-4ef5-a742-3f273f7dc943"

    def __init__(self, service, buf):
        self.state = STATE_IDLE
        self.readbuf = ''
        self.buf = buf
        Characteristic.__init__(
                self, self.BLE_CHARACTERISTIC_UUID,
                ["read", "write"], service)

    def WriteValue(self, value, options):
        global button_state
        val = ''
        for v in value:
            val += str(v)
        
        print 'get : -' + val + '-'
        if button_state == INIT_ACTIVATE:
            if self.state == STATE_IDLE:
                if val == 'rockyou':
                    self.readbuf = 'ACK'
                    self.state = STATE_WAIT_PASSWORD
                else:
                    self.readbuf = 'NAK'
            elif self.state == STATE_WAIT_PASSWORD:
                if len(val) != 16:
                    self.readbuf = 'NAK'
                    self.state = STATE_IDLE
                else:
                    self.readbuf = 'ACK'
                    self.state = STATE_WAIT_MAC
                    self.buf.setKey(val)
            else:
                if len(val) != 17:
                    self.readbuf = 'NAK'
                else:
                    self.readbuf = 'ACK'
                    self.buf.setAddr(val)
                    button_state = INIT_DISABLED
                self.state = STATE_IDLE
        else:
            print 'not triggered.'

    def ReadValue(self, options):
        value = []
        for v in self.readbuf:
            value.append(dbus.Byte(v.encode()))
        return value

def init(channel):
    global button_state
    if button_state == INIT_DISABLED:
        button_state = INIT_ACTIVATE
    else:
        button_state = INIT_DISABLED

def init_main(buf):
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(BTN_CHANGE, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.add_event_detect(BTN_CHANGE, GPIO.FALLING, callback=init, bouncetime=300)

    app = Application()
    app.add_service(BLEService(0, buf))
    app.register()

    adv = BLEAdvertisement(0)
    adv.register()

    try:
        app.run()
    except KeyboardInterrupt:
        app.quit()

if __name__ == "__main__":
    init_main(io.IO())