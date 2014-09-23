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
			@question= data[0].question
			@hint = data[0].hint
			@level = data[0].level
			@correctCode = @sce.trustAsHtml(@correct)
			@wrongCode = @sce.trustAsHtml(@wrong)

		# When first load on page
		@totalItems = 100
		@totalPages = 10
		@progressBar = 10
		@currentPage = 1

	# Page Change for pagination
	pageChanged: ()->
		console.log("Page changed to: ", @currentPage)
		@beginnerCounter = @currentPage - 1
		@progressBar = @currentPage * 10
		# console.log(@currentPage)
		@question = @data[@beginnerCounter].question
		@level = @data[@beginnerCounter].level
		@hint = @data[@beginnerCounter].hint
		@correct = @data[@beginnerCounter].correctCode
		@wrong = @data[@beginnerCounter].wrongCode
		@correctCode = @sce.trustAsHtml(@correct)
		@wrongCode = @sce.trustAsHtml(@wrong)








CodeControllers.controller("CodesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", CodesCtrl])