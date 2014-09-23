IntermediateControllers = angular.module("IntermediateControllers", [
	"ngResource", "ui.bootstrap"
])


class IntermediatesCtrl

	constructor: (@scope, @http, @resource, @Code, @sce)->
		# Making a call to the db
		@Code = @resource("/codes/:id.json")
		@Code.query (data)=>
			@data = data
			@correct = data[10].correctCode
			@wrong = data[10].wrongCode
			console.log("DATA:",@data[10].level)

			# HTML escaping in angular
			@question= data[10].question
			@hint = data[10].hint
			@level = data[10].level
			@correctCode = @sce.trustAsHtml(@correct)
			@wrongCode = @sce.trustAsHtml(@wrong)

		# When first load on page€
		@totalItems = 100
		@totalPages = 10
		@progressBar = 10
		@currentPage = 1

		# Hiding the alerts
		@successAlert = true
		@dangerAlert = true
		@beginnerSuccessAlert = true
		@intermediateSuccessAlert = true

	# Page Change for pagination
	pageChanged: ()->
		console.log("Page changed to: ", @currentPage)
		@beginnerCounter = @currentPage - 1 + 10
		@progressBar = @currentPage * 10
		# console.log(@currentPage)
		@question = @data[@beginnerCounter].question
		@level = @data[@beginnerCounter].level
		@hint = @data[@beginnerCounter].hint
		@correct = @data[@beginnerCounter].correctCode
		@wrong = @data[@beginnerCounter].wrongCode
		@correctCode = @sce.trustAsHtml(@correct)
		@wrongCode = @sce.trustAsHtml(@wrong)
		@successAlert = true
		@dangerAlert = true

	# When clicked on the correct code ...
	correctCodeClick: ()->
		console.log("correctCode!")
		@successAlert = false
		@dangerAlert = true

	# When clicked on the wrong code ...
	wrongCodeClick: ()->
		console.log("wrongCode!")
		@dangerAlert = false
		@successAlert = true





IntermediateControllers.controller("IntermediatesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", IntermediatesCtrl])


