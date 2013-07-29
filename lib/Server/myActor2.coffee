{Actor} = require "hubiquitus"

class myActor2 extends Actor

  constructor: (topology) ->
    super #This instruction is mandatory to correctly start your actor
    @type = 'myActor2'

  onMessage: (hMessage) ->
    @log "info", "Id of the person : " + JSON.stringify(hMessage.payload) + "from" + hMessage.publisher

module.exports = myActor2
