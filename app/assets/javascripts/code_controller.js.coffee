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

		# Create Randomizer to randomize codeQuestionsSet to 1 or 2
		# First hide both set of code questions
		@codeQuestionsSet1 = true
		@codeQuestionsSet2 = true
		# Randomize
		@randomNumber = Math.random()
		if @randomNumber > 0.5
			@codeQuestionsSet1 = false
		else
			@codeQuestionsSet2 = false

		# Hiding all the code to show Modal
		@codeContainer = true
		@interCodesModal = true
		@beginnerCodesModal = false

	# Clicking "Ready", out of Modal, now loads all the codes
	loadCodeModal: ()->
		@codeContainer = false
		@beginnerCodesModal = true


	# Page Change for pagination
	pageChanged: ()->
		console.log("Page changed to: ", @currentPage)
		@beginnerCounter = @currentPage - 1
		@progressBar = @currentPage * 10

		# Set the title, question, level, hint to the correct index, dependent on the page
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

		# Same logic to randomize the number and show the correct code
		@codeQuestionsSet1 = true
		@codeQuestionsSet2 = true
		@randomNumber = Math.random()
		if @randomNumber > 0.5
			@codeQuestionsSet1 = false
		else
			@codeQuestionsSet2 = false


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






