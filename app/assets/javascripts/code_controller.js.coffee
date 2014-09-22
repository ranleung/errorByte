CodeControllers = angular.module("CodeControllers", [
	"ngResource"
])


class CodesCtrl

	constructor: (@scope, @http, @resource, @Code, @sce)->
		# Use to test if angular is running
		@greeting = "hello world"
		# Making a call to the db
		@Code = @resource("/codes/:id.json")
		@Code.query (data)=>
			@data = data
			@correct = data[0].correctCode
			@wrong = data[0].wrongCode
			console.log(@codes)
			# HTML escaping in angular
			@correctCode = @sce.trustAsHtml(@correct)
			@wrongCode = @sce.trustAsHtml(@wrong)

	







CodeControllers.controller("CodesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", CodesCtrl])