# Commands
#  hubot test - test
{inspect} = require 'util'
module.exports = (robot) ->
  robot.respond /test/i, (msg) ->
    msg.http("https://api.github.com/users/technicalpickles/orgs", rejectUnauthorized: false)
      .get() (err, res, body) ->
        if err
          msg.send inspect err
        else
          msg.send body
