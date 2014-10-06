CodeFactories = angular.module("CodeFactories", [])


class Code

	constructor: (@http)->

	all: ()->
		@http.get("/codes.json")

CodeFactories.service("Code", ["$http", Code])


class User

	constructor: (@http)->

	all: ()->
		@http.get("/users.json")

	create: (newUser)->
		@http.post("/users.json", {username: newUser.username})

CodeFactories.service("User",["$http", User])