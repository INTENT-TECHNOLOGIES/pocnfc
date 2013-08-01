#
# * Copyright (c) Intent technologies 2013.
# *
# *
# *    Permission is hereby granted, free of charge, to any person obtaining a copy
# *    of this software and associated documentation files (the "Software"), to deal
# *    in the Software without restriction, including without limitation the rights
# *    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# *    of the Software, and to permit persons to whom the Software is furnished to do so,
# *    subject to the following conditions:
# *
# *    The above copyright notice and this permission notice shall be included in all copies
# *    or substantial portions of the Software.
# *
# *    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# *    INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
# *    PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
# *    FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# *    ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# *
# *    You should have received a copy of the MIT License along with Hubiquitus.
# *    If not, see <http://opensource.org/licenses/mit-license.php>.
#


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

