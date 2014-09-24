CodeControllers = angular.module("CodeControllers", [
	"ngResource", "ui.bootstrap"
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
			@title = data[0].title
			@question = data[0].question
			@hint = data[0].hint
			@level = data[0].level
			@correctCode = @sce.trustAsHtml(@correct)
			@wrongCode = @sce.trustAsHtml(@wrong)

		# When first load on page
		@totalItems = 100
		@totalPages = 10
		@progressBar = 10
		@currentPage = 1

		# Hiding the alerts
		@successAlert = true
		@dangerAlert = true
		# Alerts when reached to the end of each section
		@beginnerSuccessAlert = true
		@intermediateSuccessAlert = true

	# Page Change for pagination
	pageChanged: ()->
		console.log("Page changed to: ", @currentPage)
		@beginnerCounter = @currentPage - 1
		@progressBar = @currentPage * 10
		# console.log(@currentPage)
		@title = @data[@beginnerCounter].title
		@question = @data[@beginnerCounter].question
		@level = @data[@beginnerCounter].level
		@hint = @data[@beginnerCounter].hint
		@correct = @data[@beginnerCounter].correctCode
		@wrong = @data[@beginnerCounter].wrongCode
		@correctCode = @sce.trustAsHtml(@correct)
		@wrongCode = @sce.trustAsHtml(@wrong)
		@successAlert = true
		@dangerAlert = true
		@beginnerSuccessAlert = true


	# When clicked on the correct code ...
	correctCodeClick: ()->
		console.log("correctCode!")
		# When on the last question, display a finished course alert
		if @currentPage is 10
			@beginnerSuccessAlert = false
			@dangerAlert = true
		else
			@successAlert = false
			@dangerAlert = true
			@beginnerSuccessAlert = true

	# When clicked on the wrong code ...
	wrongCodeClick: ()->
		console.log("wrongCode!")
		@dangerAlert = false
		@successAlert = true
		@beginnerSuccessAlert = true











CodeControllers.controller("CodesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", CodesCtrl])






