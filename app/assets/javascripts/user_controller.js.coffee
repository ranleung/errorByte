UserControllers = angular.module("UserControllers", ["ngResource"])


class UsersCtrl

	constructor: (@scope, @http, @resource, @User, @location)->
		@User = @resource("/users/:id.json")
		@greeting = "hello world"

	addUser: (newUser)->
		@User.save {user: newUser}, (data)->
			console.log(data)
		@location.path("/")



UserControllers.controller("UsersCtrl", ["$scope", "$http", "$resource", "User", "$location", UsersCtrl])
