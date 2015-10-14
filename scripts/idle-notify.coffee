# Description:
#	notification before idle / after idle.
#
# Dependency:
#
# Commands:
#
# Author:
#

# ------ import modules starts.

# ------ import modules end.

module.exports = (robot) ->

	# Send message to all rooms that registered at HUBOT_CHATWORK_ROOMS
	sendToAllRooms = (message) ->
		reg_rooms = process.env.HUBOT_CHATWORK_ROOMS || ''
		rooms = reg_rooms.split ','
		if rooms[0] == ''
			rooms = []
		for room in rooms
			robot.send { room: room }, message

  # notify idle is up
  # notify after chatwork connected
  f = setInterval ->
    return if typeof robot?.send isnt 'function'
    sendToAllRooms "わたしが起きましたよー (roger)"
    clearInterval f
  , 1000

  # notify idle starts.
  on_sigterm = ->
    sendToAllRooms "おやすみなさい... (yawn)"
    setTimeout process.exit, 1000

  # overwrite bin/hubot SIGTERM events.
  if process._events.SIGTERM?
    process._events.SIGTERM = on_sigterm
  else
    process.on 'SIGTERM', on_sigterm
