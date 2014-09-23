SessionController = angular.module("SessionController", [])

class SessionsCtrl

	constructor: (@scope, @http, @resource)->

	addSession: (loginUser)->
		console.log(loginUser)
		@user = User.authenticate(session: loginUser)

		


SessionController.controller("SessionsCtrl", ["$scope", "$http", "$resource", SessionsCtrl]) 