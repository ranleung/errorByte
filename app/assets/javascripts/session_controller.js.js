// Generated by CoffeeScript 1.8.0
var SessionController, SessionsCtrl;

SessionController = angular.module("SessionController", []);

SessionsCtrl = (function() {
  function SessionsCtrl(scope, http, resource) {
    this.scope = scope;
    this.http = http;
    this.resource = resource;
  }

  SessionsCtrl.prototype.addSession = function(loginUser) {
    return console.log(loginUser);
  };

  return SessionsCtrl;

})();

SessionController.controller("SessionsCtrl", ["$scope", "$http", "$resource", SessionsCtrl]);
