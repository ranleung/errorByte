CodeControllers = angular.module("CodeControllers", [
	"ngResource
"])


class CodesCtrl

	constructor: (@scope, @http, @resource, @Code, @sce)->
		@greeting = "hello world"
		@Code = @resource("/codes/:id.json")
		@snippets = []
		@html = "<strong>this is html</strong>"
		@trustedHtml = @sce.trustAsHtml(@html)
		@Code.query (data)=>
			@codes = data









CodeControllers.controller("CodesCtrl", ["$scope", "$http", "$resource", "Code","$sce",CodesCtrl])