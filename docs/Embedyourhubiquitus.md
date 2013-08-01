#Embed your  Hubiquitus 

Installing hubiquitus on your PI is the trickiest part of this recipe. After you’ve turned on you Pi and installed Linux, i recommend you take a look on github (hubiquitus) to check which versions you need:
https://github.com/hubiquitus/hubiquitus/blob/master/docs/GettingStart.md

After you’ve installed Nodejs and ZMQ, it’s still remains Mongodb. DO NOT USE the classic way (sudo apt-get install mongodb) it will not work, because the Pi “operates” on an ARM and there are no precompiled packages for Debian. So we have to make the dough ourselves, following these instructions:

First you need some packages to compile:
```
$ sudo apt-get install build-essential libboost-filesystem-dev libboost-program-options-dev libboost-system-dev libboost-thread-dev scons libboost-all-dev python-pymongo git
```

Then you can download the source code and compile:
```
$ git clone https://github.com/skrabban/mongo-nonx86
```

The next step is the most tedious one, it takes several HOURS on the raspberry so you should first compile it on the fastest machine you have and put it to the raspberry after:
```
$ cd mongo-nonx86
$ scons
$ sudo scons --prefix=/opt/mongo install
```


It will install it in /opt/mongo (your choice). Then you should create an init.d script in order to run it when you turn on your raspberry. Follow these steps:
```
$ sudo adduser --firstuid 100 --ingroup nogroup --shell /etc/false --disabled-password --gecos "" --no-create-home mongodb
$ mkdir /var/log/mongodb/
$ chown mongodb:nogroup /var/log/mongodb/
$ mkdir /var/lib/mongodb 
$ chown mongodb:nogroup /var/lib/mongodb
$ sudo cp debian/init.d /etc/init.d/mongod
$ sudo cp debian/mongodb.conf /etc/	
$ sudo ln -s /opt/mongo/bin/mongod /usr/bin/mongod
```

You have now installed all the necessary components for the implementation of hubiquitus. Mixing all of them, you’ll get the essential dough to your dish!
To install hubiquitus:
```
$ npm install hubiquitus
$ npm install coffee-script
```

Finally, you can do a test to run Hubiquitus and see if it’s working:
```
$ cd nodes_modules/hubiquitus/sample/myProject
$ node launch.js
```

And you should see on the screen « hubiquitus started » after 1minute (Yes a Pi is slow…)
You have now installed a real time framework on your Pi and you can start communicating with the outside world! 
Specifications:
I just need to add some specifications. It happens sometimes if you did not shut down your raspberry or mongodb cleanly that you corrupted the /var/lib/mongodb folder. So you’ll have to rebuild it:
```
$ rm -R /var/lib/mongodb 
$ mkdir /var/lib/mongodb 
$ chown mongodb:nogroup /var/lib/mongodb
```

To avoid this, i recommend out following these instructions every time you want to shut down your PI:
```
$ sudo /etc/init.d/mongod stop
$ sudo shutdown –h now
```
[**Next**](Readwriteonmirfare.md)
