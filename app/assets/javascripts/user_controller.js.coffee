UserControllers = angular.module("UserControllers", ["ngResource"])


class UsersCtrl

	constructor: (@scope, @http, @resource, @routeParams, @Code, @location)->
		# For Sign Up
		@User = @resource("/users/:id.json")
		# Making a call to the db
		@http.get("/users/#{@routeParams.id}.json")
		.success (data)=>
			@user = data
			console.log("USER:",@user)
		@http.get("/codes.json")
		.success (data)=>
			@code = data
			console.log("CODE:",@code)
		@http.get("/completes.json")
		.success (data)=>
			@complete = data
			console.log("COMPLETE:",@complete)

	addUser: (newUser)->
		@User.save {user: newUser}, (data)->
			console.log(data)
		@location.path("/")



UserControllers.controller("UsersCtrl", ["$scope", "$http", "$resource", "$routeParams", "Code", "$location", UsersCtrl])
