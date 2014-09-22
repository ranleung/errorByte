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
			@codes = data[0].correctCode
			console.log(@codes)
			# HTML escaping in angular
			@correctCode = @sce.trustAsHtml(@codes)









CodeControllers.controller("CodesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", CodesCtrl])