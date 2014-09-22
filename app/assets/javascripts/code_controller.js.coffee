CodeControllers = angular.module("CodeControllers", [
	"ngResource"
])


class CodesCtrl

	constructor: (@scope, @http, @resource, @Code, @sce)->
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

		# Counter for page count
		@i = 0
		console.log(@i)

	
	next: ()->
		# Increase the counter when next is pressed
		@i += 1
		console.log("NEXT BUTTON IS PRESSED, NOW AT PAGE", @i)
		@question = @data[@i].question
		@level = @data[@i].level
		@correct = @data[@i].correctCode
		@wrong = @data[@i].wrongCode
		@correctCode = @sce.trustAsHtml(@correct)
		@wrongCode = @sce.trustAsHtml(@wrong)

	previous: ()->
		@i -= 1
		console.log("PREVIOUS BUTTON IS PRESSED, NOW AT PAGE", @i)
		@question = @data[@i].question
		@level = @data[@i].level
		@correct = @data[@i].correctCode
		@wrong = @data[@i].wrongCode
		@correctCode = @sce.trustAsHtml(@correct)
		@wrongCode = @sce.trustAsHtml(@wrong)






CodeControllers.controller("CodesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", CodesCtrl])