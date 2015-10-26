# Description:
#	Cron scripts.
#
# Dependency:
#	node-cron
#	hubot-chatwork (environment variable)
#
# Commands:
#
# Author:
#

# ------ import modules starts.

cron = require('cron').CronJob

# ------ import modules end.

TIME_ZONE = process.env.TZ

module.exports = (robot) ->

	# Send message to all rooms that registered at HUBOT_CHATWORK_ROOMS
	sendToAllRooms = (message) ->
		reg_rooms = process.env.HUBOT_CHATWORK_ROOMS || ''
		rooms = reg_rooms.split ','
		if rooms[0] == ''
			rooms = []
		for room in rooms
			robot.send { room: room }, message

# pick message from array
	random = (items) ->
		items[ Math.floor(Math.random() * items.length) ]

	# Nofify work time is begining.
	new cron
		cronTime:	"0 0 9 * * 1-5"
		start:		true
		timeZone:	TIME_ZONE
		onTick:		->
			sendToAllRooms random [
				"あっ始業時間ですよ! :o",
				"今日も一日頑張りましょうー",
				"まさかすでに働いていたとかないですよね...?"
			]

	# Notify work time is up.
	new cron
		cronTime:	"0 0 18 * * 1-5"
		start:		true
		timeZone:	TIME_ZONE
		onTick: 	->
			sendToAllRooms random [
				"定時になりましたよ!",
				"まだ終わらないんですか? (^^;)",
				"かえろーかえろー"
			]

	# Notify end of noon break.
	new cron
		cronTime:	"0 0 13 * * 1-5"
		start:		true
		timeZone:	TIME_ZONE
		onTick: 	->
			sendToAllRooms random [
				"お昼終わりましたー",
				"(yawn)",
				"はいはい再開しますよ!"
			]
