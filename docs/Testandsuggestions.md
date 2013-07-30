#Tests:
Now it’s time to test and taste it!
Launch yours topologies files and your C++ file. Just pass your Tag above the reader and you should have this kind of things on the screen: 

##[**Raspberry Pi**](Image/Pitest.jpg)

##[**Server**](Image/servertest.jpg)

It works! 

#Suggestions:

* The chief propose lot of things to improve this POC:
* You can add a system of signalization to signal to the user that the ID is authorized:
* You can add some LED 
* You can add a sound system 

* You can add an application to deal with the information contained on the card.
* You can add a web application to display the ID on the web
* You can add an application to do whatever you want with the I

* You can add an API to reverse the process and update the local database remotely.
Every time you want to update the database of authorized ID on your Pi the server send a request to the Pi. Then, the Pi will reach the database of the server and update himself. There is a way to do such a thing inside hubiquitus, with the TimerAdapter which is able to wake you Pi up!

###The chief is open-minded with any suggestions! So do not hesitate if you want to add a ingredient or to improve the way to cook!

