# Description:
#	sakura bot
#
# Dependency:
#
# Commands:
#
# Author:
#
# Special Thanks:
#	makibot http://sanographix.github.io/makibot/

# ------ import modules starts.

# ------ import modules end.

module.exports = (robot) ->

	# called
	robot.hear /^(さくら|咲良)/i, (msg) ->
		msg.send msg.random [
			"なんでしょう？",
			"どうしましたか？",
			"およびですか？",
			"気やすく呼ばないでくださいね"
		]

	# hungly
	robot.hear /^(おなか|お腹)すいた|(はら|腹)(へ|減)$/i, (msg) ->
		msg.send msg.random [
			"ダイエットって終わったんでしたっけ?",
			"あと5km歩いたら食べましょう!",
			"こんな時間にですか?",
			"我慢は禁物ですよ!"
		]

	# tired
	robot.hear /^(つか|疲)れ(まし)?た$/i, (msg) ->
		msg.send msg.random [
			"おつかれさまでした!",
			"大丈夫ですか? しっかりしてください",
			"24時間稼働している私の前でよく言えますね!^^"
		]

	# official URL
	robot.hear /(^(今|いま)?(何|なに)してる|ぐぐたす)/i, (msg) ->
		msg.send "https://plus.google.com/102808008463301583196/posts"

	# lateness
	robot.hear /(\d+時間半?|\d+分)(?:くらい|ぐらい|ほど|程)?(?:おく|遅)れます/i, (msg) ->
		msg.send "#{msg.match[1]}早く出ればいいのに! :p"
