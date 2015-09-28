# Description:
#	A simple interaction with HTTP Deamon.
#

# ------ import modules starts.

spawn = require('child_process').spawn

# ------ import modules end.

module.exports = (robot) ->
	
	INFO_PAGE =
	"""
<!DOCTYPE html>
<html>
	<head>
		<title>Sakurabot | welcome</title>
		<meta charset="utf-8">
		<meta http-eqiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1" name="viewport">
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
		<style type="text/css">
		</style>
	</head>
	<body>
		<h1>Welcome to Sakura bot!</h1>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
	</body>
</html>
	"""

	robot.router.get '/', (req, res) ->
		res.end INFO_PAGE

	robot.router.get "/version", (req, res) ->
		res.end robot.version

	robot.router.post "/ping", (req, res) ->
		res.end "PONG"

	robot.router.get "/time", (req, res) ->
		res.end "Server time is: #{new Date()}"

	robot.router.get "/info", (req, res) ->
		child = spawn('/bin/sh', ['-c', "echo I\\'m $LOGNAME@$(hostname):$(pwd) \\($(git rev-parse HEAD)\\)"])

		child.stdout.on 'data', (data) ->
			res.end "#{data.toString().trim()} running node #{process.version} [pid: #{process.pid}]"

	robot.router.get "/ip", (req, res) ->
		robot.http('http://ifconfig.me/ip').get() (err, r, body) ->
			res.end body