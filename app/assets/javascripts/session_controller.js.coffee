SessionController = angular.module("SessionController", [])

class SessionsCtrl

	constructor: (@scope, @http, @resource)->

	addSession: (loginUser)->
		console.log(loginUser)
		


SessionController.controller("SessionsCtrl", ["$scope", "$http", "$resource", SessionsCtrl]) 