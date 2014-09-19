CodeFactories = angular.module("CodeFactories", [])


class Code

	constructor: (@http)->

	all: ()->
		@http.get("/codes.json")



CodeFactories.service("Code", ["$http", Code])