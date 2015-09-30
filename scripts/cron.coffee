# Description:
#	Cron scripts.

# ------ import modules starts.

cron = require('cron').CronJob

# ------ import modules end.

# Keepalive cron.
# note: trivial implement 
#			because hubot-keepalive does not work sometimes.
module.exports = (robot) ->
	url = process.env.HUBOT_URL
	robot.enter ->
		new cron
			crontime: "*/10 * * * *"
			start: true
			onTick: ->
				robot.http(url).get() (err, res, body) ->
					robot.logger.info "keep alive..."
					return

# Notify end of noon break.
module.exports = (robot) ->
	robot.enter ->
		new cron ->
			crontime: "00 13 * * 1-5"
			start: true
			onTick: ->
				msg.send "昼は終わりだ 働け社畜ども"