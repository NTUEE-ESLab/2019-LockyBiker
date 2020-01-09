# 2019-LockyBiker
Implemet a convenient and secure bike-lock.

## Installation
   sudo pip install bluepy
   cd ~
   git clone -b rpi --single-branch https://github.com/NTUEE-ESLab/2019-LockyBiker.git
   sudo vim /etc/rc.local
   
   in /etc/rc.local, add:
      sudo service bluetooth start
      sudo /usr/bin/python /home/<user-name>/2019-LockyBiker/rpi/connect_lock.py
   before the last line(return 0)

## features
   1. when starting, the five twinckles imply that ble service is working well.
   2. if the lock's signal is not detected, the red light will keep sparking.
   3. when the green light is on, the connection is established and the authentication is passed. you can unlock your bike or let it make some noise so you can find it.

## Usage
1. register:
   use your phone register your lock. you can choose your own password for authentication.
2. lock:
   When you walk away from your bike, it will be locked. You can also use your key to lock the bike.
3. unlock:
   When you walk through your bike, you can use your key to unlock the bike.
4. find your bike:
   If you can't find your bike, just let the lock make some noise so you can find it!
