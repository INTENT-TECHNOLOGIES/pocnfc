Welcome! This article will help you achieve a POC (Proof of concept).

#Raspberry Pi as a real time NFC reader

On the menu today, the chief offers a real time NFC reader! The aim of this POC is to propose an implementation of a smart object able to push the data contained on an NFC tag to a remote Internet platform in real time using open and affordable building blocks (commodity hardware, open source software). 
I don’t need to remind you that the choice of ingredients is essential to make a dish. The picky chief choses them according to their origin and price. We needed open-source and low-cost solutions.

###Ingredients: 
* Hubiquitus, an open-source and free framework for real time application
* A Raspberry Pi with a Linux OS for embed hubiquitus
* A bridge Raspberry to Arduino to connect the NFC module
* A NFC Reader
* Mirfare Tags
* An SD card 32G 
* An Ethernet cable
* An internet connection
* A computer  to use as a Linux server 

You can find the hardware part on this cooking-hacks website for about 130 euros:

http://www.cooking-hacks.com/index.php/shop/raspberry-pi/rfid-13-56-mhz-shield-for-raspberry-pi.html

I’ll leave the other ingredients at your discretion, you can find them everywhere.

In order to succeed the dish, let’s take a look at these documents in order to learn about the open-source framework and the NFC technology:

http://hubiquitus.com/ Look at examples and lessons to practice
http://www.docstoc.com/docs/47769968/RFID--MIFARE-Data-Structure for Mirfare Tags/NFC

You also need C++ knowledge because we use Arduino, Linux, NodeJs (javascript/coffeescript) and a little bit of computer networks. When you mix all of this knowledge you get your meal!

Now let’s get our hands dirty!


###Directions
* [**Embed your hubiquitus**](docs/Embedyourhubiquitus.md)
* [**Read and write on your NFC TAG**](docs/Readwriteonmirfare.md)
* [**Interaction Arduino-Node js**](docs/Integrate-nfc-hubiquitus.md)
* [**Architecture of your project**](docs/Architecture.md)
* [**Configuration of yours files**](docs/Configuration.md)
* [**Tests and Chief suggestions**](docs/Testandsuggestions.md)

The source code of this recipe is licensed under the terms of the GNU General Public License for the Arduino part and MIT license for the Hubiquitus code.

