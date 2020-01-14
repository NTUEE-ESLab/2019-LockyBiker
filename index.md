## 2019-LockyBiker

Are you always tired of finding your bike? Did you ever give up locking your bike because of incovenient process?

Well then, LockyBiker is the best bike lock ever for you!
We implemet a convenient and secure bike-lock, where users can lock/unlock their bikes remotely, and find their bikes when they disappear in the "bike ocean".

### requirements

LockyBiker is made up of three parts. 

1. wireless key
We use Raspberry Pi 3 to build our wireless key. On RPi, we run a BLE central to scan the bike lock and deliver commands. One LED and three buttons are also needed for our program.
2. bike lock
We use ti development board to build our wireless bike lock. On RPi, we run a BLE peripheral to deal with the commands sent from the key and conrtrols the motor to lock/unlock the bike.
3. android cellphone
We use android app to authenticate user and initialize passwords of bike lock and key. Therefore, once you loose you key accidently, you can make a new key and register your password onto it to unlock your bike.

### usage

1. register: use your phone register your lock. you can choose your own password for authentication.
2. lock: When you walk away from your bike, it will be locked. You can also use your key to lock the bike.
3. unlock: When you walk through your bike, you can use your key to unlock the bike.
4. find your bike: If you can't find your bike, just let the lock make some noise so you can find it!
### video link
https://drive.google.com/open?id=1dlnSVoTI82TCObzH15urG_eBVxj7wtqH
