# Description:
#	sakura greeting hello, etc...
# Commands:

# ------ import modules starts.

moment = require 'moment'

# ------ import modules end.

module.exports = (robot) ->

	# date
	robot.hear /(今日)?何日(\?|？)/i, (msg) ->
		msg.send msg.random [
			"日付感覚がなくなっちゃたんですか?",
			"カレンダー見ろよ^^",
			"#{moment().locale('ja').format('YYYY年MM月DD日(ddd)')}ですよ"
		]

	# time
	robot.hear /(今)?何時(\?|？)/i, (msg) ->
		msg.send msg.random [
			"画面の上か右下見てくださいね^^",
			"わかってることわざわざ聞くなんて...",
			"#{moment().locale('ja').format('HH時mm分ss秒')}ですよ"
		]

	# morning
	robot.hear /おはよう(.*)/i, (msg) ->
		hour = new Date().getHours()

		# right time
		if 5 <= hour <= 11
			msg.send msg.random [
				"おはようございます!今日もがんばりますよー",
				"のんきにあいさつしている場合ですか",
				"朝からご苦労なことですね"
			]
			return

		# wrong time
		if 0 <= hour <= 4
			msg.send msg.random [
				"|-)",
			]
			return
		if 12 <= hour <= 17
			msg.send msg.random [
				"業界人気取りのあいさつとかいいですから^^;",
				"さっき起きたんですかー?",
				"お、おう..."
			]
			return
		if 18 <= hour <= 23
			msg.send msg.random [
				"業界人気取りのあいさつとかいいですから^^;",
				"いくらなんでもこの時間におはようはないでしょ...",
				"いやいや、おはようて！"
			]


	# noon
	robot.hear /こんにち(は|わ)(.*)/i, (msg) ->
		hour = new Date().getHours()

		# right time
		if 12 <= hour <= 17
			msg.send msg.random [
				"こんにちは! この後もがんばるぞー",
				"どうもー",
				"ほんとに元気だけがとりえですね!"
			]
			return

		# wrong time
		if 0 <= hour <= 4
			msg.send msg.random [
				"|-)",
			]
			return
		if 5 <= hour <= 11
			msg.send msg.random [
				"こんn...、おはようございます!",
				"おっと、ちょっと気が早いのでは?",
				"もう昼気分とは"
			]
			return
		if 18 <= hour <= 23
			msg.send msg.random [
				"もうこんにちはの時間じゃないですよ!",
				"いくらなんでもこの時間におはようはないでしょ...",
				"え、もしかしてまだ働いてるんですか...?"
			]

	# evening
	robot.hear /こんばん(は|わ)(.*)/i, (msg) ->
		hour = new Date().getHours()

		# right time
		if 18 <= hour <= 23
			msg.send msg.random [
				"こんばんは! 今日も一日おつかれさまです",
				"遊んでないでもう寝ろよ",
				"こんな時間なのにbotしか話す相手がいないんですか?"
			]
			return

		# wrong time
		if 0 <= hour <= 4
			msg.send msg.random [
				"|-)",
			]
			return
		if 5 <= hour <= 11
			msg.send msg.random [
				"こんb...、おはようございます!",
				"寝ぼけてないで、もう朝ですよ!",
				"えっ...徹夜、したの...?"
			]
			return
		if 12 <= hour <= 17
			msg.send msg.random [
				"こんばんは? 少しおつかれのようですね",
				"もう少ししてからのあいさつですよ!",
				"こんにちは^^"
			]
