#Read and write on your TAG NFC

As I have told you above, we are going to use C++ in order to manage the NFC module. 
First you have to be sure you know how a mirfare tag is composed. 
Second, remember to connect each part on the pi (Connection Bridge, NFC module...) before compiling and executing you code. 

Then you can have a look at those webpages in the cooking website: 

http://www.cooking-hacks.com/index.php/documentation/tutorials/raspberry-pi-to-arduino-shields-connection-bridge
http://www.cooking-hacks.com/index.php/documentation/tutorials/rfid-13-56-mhz-nfc-module-for-raspberry-pi

As you can see, everything you need to read and write is on the page. Cooking hacks is providing us with the source code in order to do so. Remember to configure the Arduino bridge.

Make sure you understand each part of the code before doing any modifications.

With our equipment it’s now possible to test it (read and write or read only). There is two files in the arduino folder one for write on you Tag (readandwrite.cpp) and an other one for the POC (pocnfc.cpp)

Just compile it on the proper folder (Remember to include the ardupi.h library in you folder) with this command:
```
$ g++ -lrt -lpthread my_program.cpp arduPi.cpp -o my_program
```

Then run it with:                   
```                     
$ sudo ./my_program
```

You can see on your screen the information that your card contain. It works!
You can now change the code in order to read and write what you want or you can change the keys if you want to have you proper authentication. 

Make sure you read what is written on the webpage, there is some very important information especially about blocks you do not have to change.

There are also some modifications to do inside the source code that you will find in lib/Pi/Arduino.

[**Previous**](Embedyourhubiquitus.md)           [**Next**](Integrate-nfc-hubiquitus.md)
