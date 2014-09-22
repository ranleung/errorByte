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
			@hint = data[0].hint
			@level = data[0].level
			@correctCode = @sce.trustAsHtml(@correct)
			@wrongCode = @sce.trustAsHtml(@wrong)

		# Counter for page count
		@beginnerCounter = 0
		console.log(@beginnerCounter)

	
	next: ()->
		# Increase the counter when next is pressed
		@beginnerCounter += 1
		console.log("NEXT BUTTON IS PRESSED, NOW AT PAGE", @beginnerCounter)
		@question = @data[@beginnerCounter].question
		@level = @data[@beginnerCounter].level
		@hint = @data[@beginnerCounter].hint
		@correct = @data[@beginnerCounter].correctCode
		@wrong = @data[@beginnerCounter].wrongCode
		@correctCode = @sce.trustAsHtml(@correct)
		@wrongCode = @sce.trustAsHtml(@wrong)

	previous: ()->
		# Decrease counter when previous is pressed
		@beginnerCounter -= 1
		console.log("PREVIOUS BUTTON IS PRESSED, NOW AT PAGE", @beginnerCounter)
		@question = @data[@beginnerCounter].question
		@level = @data[@beginnerCounter].level
		@hint = @data[@beginnerCounter].hint
		@correct = @data[@beginnerCounter].correctCode
		@wrong = @data[@beginnerCounter].wrongCode
		@correctCode = @sce.trustAsHtml(@correct)
		@wrongCode = @sce.trustAsHtml(@wrong)






CodeControllers.controller("CodesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", CodesCtrl])