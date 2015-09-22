# Description:
#	sakura bot
# Commands:
#	
# Special Thanks:
#	makibot http://sanographix.github.io/makibot/

# ------ import modules starts.

# ------ import modules end.

module.exports = (robot) ->
  
	# called
	robot.hear /さくら|咲良/i, (msg) ->
		msg.send msg.random [
			"なんですか？",
			"どうしましたか？",
			"およびですか？",
			"気やすく呼ばないでくださいね"
		]

	# hungly
	robot.hear /(おなか|お腹)すいた|(はら|腹)(へ|減)/i, (msg) ->
		msg.send msg.random [
			"ダイエットって終わったんでしたっけ?",
			"あと5km歩いたら食べましょう!",
			"こんな時間にですか?",
			"我慢は禁物ですよ!"
		]

	# tired
	robot.hear /(つか|疲)れた/i, (msg) ->
		msg.send msg.random [
			"おつかれさまでした!",
			"大丈夫ですか? しっかりしてください",
			"24時間稼働している私の前でよく言えますね!^^"
		]
