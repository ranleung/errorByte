IntermediateControllers = angular.module("IntermediateControllers", [
	"ngResource", "ui.bootstrap"
])


class IntermediatesCtrl

	constructor: (@scope, @http, @resource, @sce)->
		@Code = @resource("/codes/:id.json")
		@Code.query (data)=>
			@data = data






IntermediateControllers.controller("IntermediatesCtrl", ["$scope", "$http", "$resource", "$sce", IntermediatesCtrl])