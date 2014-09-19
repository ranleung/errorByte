class Router

	constructor: (@routeProvider, @locationProvider)->

		@routeProvider.
			when "/",
				templateUrl: "/site_templates",
				controller: "SitesCtrl as sites"


		@routeProvider.
			when "/codes",
				templateUrl: "/code_templates",
				controller: "CodesCtrl as codes"


		@locationProvider.html5Mode(true)

CodeRouter = angular.module("CodeRouter", [
	"ngRoute"
])

CodeRouter.config(["$routeProvider", "$locationProvider", Router])

CodeRouter.config(["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common["X-CSRF-Token"] = $('meta[name=csrf-token]').attr("content")
])

