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
			console.log("DATA:",@data[0].level)

			# HTML escaping in angular
			@question= data[0].question
			@level = data[0].level
			@correctCode = @sce.trustAsHtml(@correct)
			@wrongCode = @sce.trustAsHtml(@wrong)

	
	next: ()->
		console.log("hi")






CodeControllers.controller("CodesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", CodesCtrl])