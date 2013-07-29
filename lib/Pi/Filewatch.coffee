#
# * Copyright (c) Novedia Group 2012.
# *
# *    This file is part of Hubiquitus
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
{InboundAdapter} = require "hubiquitus"
fs = require "fs"

#
# Class that defines a Filwatch Inbound Adapter
# This Adapter send the value of an object property to the actor each time the file is modified
#
class Filewatch extends InboundAdapter

  #
  # Adapter's constructor
  # @param properties {object} Launch properties of the adapter
  #
  constructor: (properties) ->
    super
    if @properties.path
      @path = @properties.path
    else
      @owner.log "error", "FilwatchAdapter : You must provide a path to watch"
    @type = "Filewatch"

  #
  # @overload start()
  #   Method which start the adapter.
  #   When this adapter is started, the channel can receive hMessage
  #
  start: () ->
    while @started is false
      super
      @owner.log "debug" ,"Watching : " + @path
      @watch()
      @owner.log "debug", "Recipient actor : " + @owner.actor

  watch: () ->
    fs.watchFile @path, (hMessage) =>
      fs.readFile @path, (err, data) =>
        unless err
          @receive data

  h_fillMessage: (hMessage, callback) ->
    hMessage.actor = hMessage.actor or @owner.actor
    hMessage.publisher = hMessage.publisher or @owner.actor
    hMessage.type = hMessage.type or "filePayload"
    super

  #
  # @overload stop()
  #   Method which stop the adapter.
  #   When this adapter is stopped, the actor will not receive hMessage form this adapter anymore
  #
  stop: () ->
    if @started
      fs.unwatchFile "@path"

module.exports = Filewatch
