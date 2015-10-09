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

		# Keepalive cron.
		# note: trivial implement
		#			because hubot-keepalive does not work sometimes.
		new cron
			cronTime:	"0 */10 * * * *"
			start:		true
			timeZone: TIME_ZONE
			onTick: 	->
				robot.http(process.env.HUBOT_URL).get() (err, res, body) ->
					if err == ''
						robot.logger.info "keep alive..."
					else
						robot.logger.error err
					return

		# Nofify work time is begining.
		new cron
			cronTime: "0 0 9 * * 1-5"
			start:		true
			timeZone:	TIME_ZONE
			onTick:		->
				sendToAllRooms "始業してるぞ 四の五の言わずに働けや"

		# Notify work time is up.
		new cron
			cronTime:	"0 0 18 * * 1-5"
			start:		true
			timeZone: TIME_ZONE
			onTick: 	->
				sendToAllRooms "いつまで働いてんだよ 定時だぞ"

		# Notify end of noon break.
		new cron
			cronTime: "0 0 13 * * 1-5"
			start: 		true
			timeZone: TIME_ZONE
			onTick: 	->
				sendToAllRooms "昼は終わりだ 働け社畜ども"
