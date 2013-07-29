#Define modules we need
mongo = require "mongodb"
fs = require "fs"


{Actor} = require "hubiquitus"


class myActor1 extends Actor

#Starting the database
  host = "127.0.0.1"
  port = mongo.Connection.DEFAULT_PORT

  Server = new mongo.Server host, port, {}
  db = new mongo.Db "idtest", Server
  db.open (error) =>
    if error
      console.log "Pb connection à mongodb"
    else
      console.log "Connected! "

  #Simple command to start and define the actor
  constructor: (topology) ->
    super
    @type = 'myActor1'

#Getting and analyse the hMessage sent by the adapter
  onMessage: (data) ->

    @getuser data.payload.id, (user) =>                 #Fonction which get the type of the hMessage in parameter and have a user for callback
      console.log "", data
      if not user                                #If the ID is not in the database
        console.log "No user"                     #The person is not autorized
      else
        console.log "we have a user :", data.payload.id   #Display the ID of the autorized persons
        @send @buildMessage("urn:localhost:myActor2", "ID", data.payload.id)

#Fonction which find out if the ID is autorized or not 
  getuser: (id, callback) ->

    db.collection "user", (error, collection)=> #If there is a collection "user" which contained the IDs
      console.log "We have a collection"
      collection.find {"id":id.toString()}, (error, cursor) => #We are trying to match the IDs

        cursor.toArray (error, users) =>
          if users.length == 0
            callback(false)
          else
            callback(users[0])


module.exports = myActor1

