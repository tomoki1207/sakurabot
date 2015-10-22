# Description:
#	talk with sakura using DOCOMO dialogue API.
#
# Dependency:
#
# Configuration:
#   HUBOT_DOCOMO_DIALOGUE_API_KEY
#   HUBOT_SELF_UID
#
# Author:

# ------ import modules starts.
module.exports = (robot) ->
  robot.brain.data.dialogue = {}

  # reply to=xxxxx or aid=xxxxx
  robot.hear ///(?:aid\=|to:)#{process.env.HUBOT_SELF_UID}(?:.+)\n(.*)///i, (msg) ->
    m = msg.match[1]
    return if m is ''
    payload = { utt: m, nickname: msg.message.user.name }

    room_id = msg.message.user.reply_to || msg.message.user.room
    if pre_context = robot.brain.data.dialogue[room_id]
      payload.context = pre_context.context
      payload.mode = pre_context.mode

    msg
    .http 'https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue'
    .header 'Content-Type', 'application/json'
    .query APIKEY: process.env.HUBOT_DOCOMO_DIALOGUE_API_KEY
    .post(JSON.stringify(payload)) (err, _, body) ->
      if err?
        robot.logger.error err
      else
        data = JSON.parse(body)
        msg.reply data.utt
        robot.brain.data.dialogue[room_id] = { context: data.context, mode: data.mode }
