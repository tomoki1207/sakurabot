# Description:
#	sakura bot
# Commands:
#	
# Special Thanks:
#	makibot http://sanographix.github.io/makibot/

module.exports = (robot) ->
  
	// called
	robot.hear /さくら|咲良/i, (msg) ->
		msg.send msg.random [
			"なんですか？",
			"どうしましたか？",
			"およびですか？",
			"気やすく呼ばないでくださいね",
			"..."
		]

	// hungly
	robot.hear /(おなか|お腹)すいた|(はら|腹)(へ|減)/i, (msg) ->
		msg.send msg.random [
			"ダイエットって終わったんでしたっけ?",
			"あと5km歩いたら食べましょう!",
			"こんな時間にですか?",
			"..."
		]

	// tired
	robot.hear /(つか|疲)れた/i, (msg) ->
		msg.send msg.random [
			"おつかれさまでした!",
			"しっかりしてください",
			"24時間稼働している私の前でよく言えますね!^^",
			"..."
		]