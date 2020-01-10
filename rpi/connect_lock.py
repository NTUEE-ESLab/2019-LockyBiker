from bluepy.btle import Peripheral, UUID
from bluepy.btle import Scanner, DefaultDelegate
from Crypto.Cipher import AES
import RPi.GPIO as GPIO
import struct
import time
import io

LOCK_BTNSIGNAL = 100
SHOUT_BTNSIGNAL = 101
IDLE_BTNSIGNAL = 102
NOTYET_SIGNAL = 103
button_state = NOTYET_SIGNAL

class NoInitException(Exception):
    def __init__(self, message):
        Exception.__init__(self, message)


def dark():
    GPIO.output(R, False)
    GPIO.output(G, False)
    GPIO.output(B, False)

def lock(channel):
    global button_state
    if button_state == IDLE_BTNSIGNAL:
        print('lock')
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

def lock_main(buf):
    global button_state

    GPIO.setmode(GPIO.BCM)
    GPIO.setup(OPEN, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.setup(SHOUT, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.setup(R, GPIO.OUT)
    GPIO.setup(G, GPIO.OUT)
    GPIO.setup(B, GPIO.OUT)
    dark()
    GPIO.add_event_detect(OPEN, GPIO.FALLING, callback=lock, bouncetime=300)
    GPIO.add_event_detect(SHOUT, GPIO.FALLING, callback=shout, bouncetime=300)

    scanner = Scanner()
    devices = scanner.scan(1.0)

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
    dark()
    time.sleep(0.5)
    GPIO.output(R, True)
    GPIO.output(G, True)
    GPIO.output(B, True)
    time.sleep(0.5)
    dark()

    while True:
        try:
            if buf.getAddr() == '' or buf.getKey() == '':
                raise NoInitException('not registered yet.')

            dev = Peripheral(buf.getAddr(), 'public')

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
            
            aes = AES.new(buf.getKey(), AES.MODE_ECB)
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
                if dev.getState() == 'disc':
                    raise Exception('disconnected.')
                pass

            if button_state == SHOUT_BTNSIGNAL:
                ch.write('1')
                dark()
                GPIO.output(R, True)
            elif button_state == LOCK_BTNSIGNAL:
                ch.write('0')
                dark()
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
            time.sleep(0.8)
        except NoInitException:
            for i in range(5):
                dark()
                GPIO.output(R, True)
                time.sleep(0.15)
                dark()
                GPIO.output(G, True)
                time.sleep(0.15)
        except Exception as e:
            print "exception : " , e
            dark()
            GPIO.output(R, True)
            time.sleep(0.05)
            dark()
            time.sleep(0.05)
            GPIO.output(R, True)
            time.sleep(0.05)
            dark()
            time.sleep(0.05)
            GPIO.output(R, True)
            time.sleep(0.05)
            dark()
            time.sleep(0.05)
            GPIO.output(R, True)
            time.sleep(0.05)
        finally:
            try:
                dev.disconnect()
            except:
                pass
            button_state = NOTYET_SIGNAL
            dark()

if __name__ == "__main__":
    lock_main(io.IO())