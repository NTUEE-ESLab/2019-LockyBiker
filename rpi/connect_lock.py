from bluepy.btle import Peripheral, UUID
from bluepy.btle import Scanner, DefaultDelegate
from Crypto.Cipher import AES
import RPi.GPIO as GPIO
import struct
import time

# scanner = Scanner()
# devices = scanner.scan(6.0)
# n=0
# for dev in devices:
#     for (adtype, desc, value) in dev.getScanData():
#         if(value == "ProjectRockyou"):
#             print "%d: Device %s (%s), RSSI=%d dB" % (n, dev.addr,dev.addrType, dev.rssi)
#             for (adtype,desc,value) in dev.getScanData():
#                 print " %s = %s" % (desc, value)
#     n +=1
# number = input('Enter your device number: ')
# print('Device', number)
# print(bytes(devices[number].addr))
# print "Connecting..."

LOCK_BTNSIGNAL = 100
SHOUT_BTNSIGNAL = 101
IDLE_BTNSIGNAL = 102
NOTYET_SIGNAL = 103
button_state = NOTYET_SIGNAL

def dark():
    GPIO.output(R, False)
    GPIO.output(G, False)
    GPIO.output(B, False)

def lock(channel):
    global button_state
    if button_state == IDLE_BTNSIGNAL:
        print('shout')
        button_state = LOCK_BTNSIGNAL


def shout(channel):
    global button_state
    if button_state == IDLE_BTNSIGNAL:
        print('shout')
        button_state = SHOUT_BTNSIGNAL
    

OPEN = 12
SHOUT = 26
R = 16
G = 20
B = 21

GPIO.setmode(GPIO.BCM)
GPIO.setup(OPEN, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(SHOUT, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(R, GPIO.OUT)
GPIO.setup(G, GPIO.OUT)
GPIO.setup(B, GPIO.OUT)
dark()
GPIO.add_event_detect(OPEN, GPIO.FALLING, callback=lock, bouncetime=300)
GPIO.add_event_detect(SHOUT, GPIO.FALLING, callback=shout, bouncetime=300)

lock_addr = open('./mac_addr').read()
key = open('./key').read()
aes = AES.new(key, AES.MODE_ECB)

while True:
    try:
        dev = Peripheral(lock_addr, 'public')

        print("Services...")

        for svc in dev.services:
            print(str(svc))
        
        testService_data = dev.getServiceByUUID(UUID('f0001130-0451-4000-b000-000000000000'))
        
        ch = testService_data.getCharacteristics()[0]
        ch.write('rockyou')
        cipher = ch.read()
        print cipher
        if len(cipher) != 16:
            raise Exception("invalid cipher length : {} content : {}".format(len(cipher), cipher))
        
        plaintext = bytearray(aes.decrypt(cipher))
        for i in range(16):
            if plaintext[i] == 0xff:
                plaintext[i] = 0
            else:
                plaintext[i] += 1
                break
        _cipher = aes.encrypt(bytes(plaintext))
        ch.write(_cipher)

        response = ch.read()
        print response
        if response == 'NAK':
            raise Exception("challenge failed")
        elif response != 'ACK':
            raise Exception("unknown respond")

        GPIO.output(G, True)
        button_state = IDLE_BTNSIGNAL
        while button_state == IDLE_BTNSIGNAL:
            pass

        if button_state == SHOUT_BTNSIGNAL:
            ch.write('1')
            GPIO.output(R, True)
        elif button_state == LOCK_BTNSIGNAL:
            ch.write('0')
            GPIO.output(B, True)

        response = ch.read()
        print response

        if response != 'OK':
            GPIO.output(R, True)
            GPIO.output(G, True)
            GPIO.output(B, True)
            time.sleep(0.5)
            dark()
            time.sleep(0.5)
            GPIO.output(R, True)
            GPIO.output(G, True)
            GPIO.output(B, True)
            time.sleep(0.5)
            dark()
            time.sleep(0.5)
            GPIO.output(R, True)
            GPIO.output(G, True)
            GPIO.output(B, True)
            time.sleep(0.5)
            raise Exception("unlock or shout fail")
        # a = raw_input()

    except Exception as e:
        print "exception : " , e
    finally:
        try:
            dev.disconnect()
        except:
            pass
        button_state = NOTYET_SIGNAL
        time.sleep(0.5)
        dark()
        # a = raw_input()
