#Integrate the NFC reader with Hubiquitus

Now that you’ve installed hubiquitus and you know how to deal with your NFC reader it’s time to integrate those two technologies. We need to get the information from the reader and transform it into a suitable format in order to be understood by javascript.
NodeJs (precisely mongodb) is most likely using JSON files for data exchange. So what we have to do is to build our JSON file inside the Arduino code. Then, you can just add a function called “ofstream” to your open source code which will open a text file and write properly inside in order to have a file which contains something like that:

```
{“id”:”yourID”} in yourfile.JSON
```

If you have this kind of file it’s now very easy to manipulate with JavaScript. To have “yourID” you just have to read and parse your file! Please take a look to the source code section we here use a serializer in order to read, parse your file and convert it in a hMessage. You also need to change some other things inside the code; I will also refer to exemple.cpp in the lib directory.

Now, each time you will pass the TAG above the reader you will create a file which contains the data of the TAG.
To manipulate the file, you have 2 functions in node js which are very useful to get this data and do whatever you want with this: watchFile and readFile. You can have the documentation on the nodeJS website:
http://nodejs.org/api/fs.html

Here, we will check that this ID is authorized (compare it to a database which contain the authorized ID) and send it to a server. 
So what we have to do is to watch the file and each time it is modified we read it and get the id. Then we have to convert it into a hMessage and send it to the server. 
If it’s a little bit confusing for you then take a look at the next part in order to understand the structure of the project.

Concerning the server side you just have to install hubiquitus (here you can use the classic way).

[**Previous**](Readwriteonmirfare.md)           [**Next**](Architecture.md)
