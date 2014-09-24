UserControllers = angular.module("UserControllers", ["ngResource"])


class UsersCtrl

	constructor: (@scope, @http, @resource, @routeParams, @User, @location)->
		# Making a call to the db
		# @http.get("/users/#{@routeParams.id}.json")
		@http.get("/users/1.json")
		.success (data) =>
			@data = data
			console.log("USER DATA:",@data)
		

	addUser: (newUser)->
		@User.save {user: newUser}, (data)->
			console.log(data)
		@location.path("/")



UserControllers.controller("UsersCtrl", ["$scope", "$http", "$resource", "$routeParams", "User", "$location", UsersCtrl])
