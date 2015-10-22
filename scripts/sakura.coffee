# Description:
#	sakura bot
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

	# official URL
	robot.hear /(^(今|いま)?(何|なに)してる|ぐぐたす)/i, (msg) ->
		msg.send "https://plus.google.com/102808008463301583196/posts"

	# lateness
	robot.hear /(\d+時間半?|\d+分)(?:くらい|ぐらい|ほど|程)?(?:おく|遅)れます/i, (msg) ->
		msg.send "#{msg.match[1]}早く出ればいいのに! :p"
