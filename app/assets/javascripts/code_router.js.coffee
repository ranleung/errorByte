class Router

	constructor: (@routeProvider, @locationProvider)->

		# Route to Home
		@routeProvider.
			when "/",
				templateUrl: "/site_templates",
				controller: "SitesCtrl as sites"

		# Route for about page
		@routeProvider.
			when "/abouts",
				templateUrl: "/about_templates",
				controller: "AboutsCtrl as abouts"

		# Route for creating a new user
		@routeProvider.
			when "/signup",
				templateUrl: "/user_templates",
				controller: "UsersCtrl as users"

		# Route to Beginner code challenges
		@routeProvider.
			when "/codes",
				templateUrl: "/code_templates",
				controller: "CodesCtrl as codes"

		# Route to Intermediate code challenges
		@routeProvider.
			when "/intermediates",
				templateUrl: "/code_templates",
				controller: "IntermediatesCtrl as codes"

		# Route for creating sessions
		@routeProvider.
			when "/login",
				templateUrl: "/session_templates",
				controller: "SessionsCtrl as sessions"

		# Route for User's Profile
		@routeProvider.
			when "/users/:id",
				templateUrl: "/user_templates/show",
				controller: "UsersCtrl as users"

		# Route for Log Out
		@routeProvider.
			when "/logout",
				templateUrl: "/site_templates"


		@locationProvider.html5Mode(true)

CodeRouter = angular.module("CodeRouter", [
	"ngRoute"
])

CodeRouter.config(["$routeProvider", "$locationProvider", Router])

CodeRouter.config(["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common["X-CSRF-Token"] = $('meta[name=csrf-token]').attr("content")
])

