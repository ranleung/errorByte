class Router

	constructor: (@routeProvider, @locationProvider)->

		# Route to Home
		@routeProvider.
			when "/",
				templateUrl: "/site_templates",
				controller: "SitesCtrl as sites"

		# Rout to code challenges
		@routeProvider.
			when "/codes",
				templateUrl: "/code_templates",
				controller: "CodesCtrl as codes"

		# Route for creating a new user
		@routeProvider.
			when "/users/new",
				templateUrl: "/user_templates",
				controller: "UsersCtrl as users"


		@locationProvider.html5Mode(true)

CodeRouter = angular.module("CodeRouter", [
	"ngRoute"
])

CodeRouter.config(["$routeProvider", "$locationProvider", Router])

CodeRouter.config(["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common["X-CSRF-Token"] = $('meta[name=csrf-token]').attr("content")
])

