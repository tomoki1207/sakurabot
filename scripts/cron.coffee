# Description:
#	Cron scripts.
#
# Dependency:
#	node-cron
#	hubot-chatwork
#
# Commands:
#
# Author:
#

# ------ import modules starts.

cron = require('cron').CronJob

# ------ import modules end.

ROOMS = process.env.HUBOT_CHATWORK_ROOMS
TIME_ZONE = process.env.TZ

module.exports = (robot) ->

		# Keepalive cron.
		# note: trivial implement 
		#			because hubot-keepalive does not work sometimes.
		new cron
			cronTime: "0 */10 * * * *"
			start: true
			timeZone: TIME_ZONE
			onTick: ->
				robot.http(process.env.HUBOT_URL).get() (err, res, body) ->
					robot.logger.info "keep alive..."
					return

		# Notify work time is up.
		new cron
			cronTime: "0 0 18 * * 1-5"
			start: true
			timeZone: TIME_ZONE
			onTick: ->
				robot.send ROOMS, "いつまで働いてんだよ 定時だぞ"

		# Notify end of noon break.
		new cron
			cronTime: "0 0 13 * * 1-5"
			start: true
			timeZone: TIME_ZONE
			onTick: ->
				robot.send ROOMS, "昼は終わりだ 働け社畜ども"