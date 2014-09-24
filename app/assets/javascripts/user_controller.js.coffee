UserControllers = angular.module("UserControllers", ["ngResource"])


class UsersCtrl

	constructor: (@scope, @http, @resource, @routeParams, @User, @location)->
		# For Creating a user
		@User = @resource("/users/:id.json")
		
		# Making a call to the db
		# @http.get("/users/#{@routeParams.id}.json")
		@http.get("/users/1.json")
		.success (data)=>
			@user = data
			console.log("USER:",@user)
		@http.get("/codes/1.json")
		.success (data)=>
			@code = data
			console.log("CODE:",@code)

	addUser: (newUser)->
		@User.save {user: newUser}, (data)->
			console.log(data)
		@location.path("/")



UserControllers.controller("UsersCtrl", ["$scope", "$http", "$resource", "$routeParams", "User", "$location", UsersCtrl])
