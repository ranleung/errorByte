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
			@title = data[10].title
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
		@beginnerCodesModal = true
		@interCodesModal = false

	# Clicking "Ready", out of Modal, now loads all the codes
	loadCodeModal: ()->
		@codeContainer = false
		@interCodesModal = true

	# Page Change for pagination
	pageChanged: ()->
		console.log("Page changed to: ", @currentPage)
		@beginnerCounter = @currentPage - 1 + 10
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
		@intermediateSuccessAlert = true

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
			@intermediateSuccessAlert = false
			@dangerAlert = true
		else
			@successAlert = false
			@dangerAlert = true
			@intermediateSuccessAlert = true

	# When clicked on the wrong code ...
	wrongCodeClick: ()->
		console.log("wrongCode!")
		@dangerAlert = false
		@successAlert = true
		@intermediateSuccessAlert = true





IntermediateControllers.controller("IntermediatesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", IntermediatesCtrl])


