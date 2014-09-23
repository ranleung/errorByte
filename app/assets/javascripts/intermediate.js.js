// Generated by CoffeeScript 1.8.0
var IntermediateControllers, IntermediatesCtrl;

IntermediateControllers = angular.module("IntermediateControllers", ["ngResource", "ui.bootstrap"]);

IntermediatesCtrl = (function() {
  function IntermediatesCtrl(scope, http, resource, Code, sce) {
    this.scope = scope;
    this.http = http;
    this.resource = resource;
    this.Code = Code;
    this.sce = sce;
    this.Code = this.resource("/codes/:id.json");
    this.Code.query((function(_this) {
      return function(data) {
        _this.data = data;
        _this.correct = data[10].correctCode;
        _this.wrong = data[10].wrongCode;
        console.log("DATA:", _this.data[10].level);
        _this.question = data[10].question;
        _this.hint = data[10].hint;
        _this.level = data[10].level;
        _this.correctCode = _this.sce.trustAsHtml(_this.correct);
        return _this.wrongCode = _this.sce.trustAsHtml(_this.wrong);
      };
    })(this));
    this.totalItems = 100;
    this.totalPages = 10;
    this.progressBar = 10;
    this.currentPage = 1;
    this.successAlert = true;
    this.dangerAlert = true;
    this.beginnerSuccessAlert = true;
    this.intermediateSuccessAlert = true;
  }

  IntermediatesCtrl.prototype.pageChanged = function() {
    console.log("Page changed to: ", this.currentPage);
    this.beginnerCounter = this.currentPage - 1 + 10;
    this.progressBar = this.currentPage * 10;
    this.question = this.data[this.beginnerCounter].question;
    this.level = this.data[this.beginnerCounter].level;
    this.hint = this.data[this.beginnerCounter].hint;
    this.correct = this.data[this.beginnerCounter].correctCode;
    this.wrong = this.data[this.beginnerCounter].wrongCode;
    this.correctCode = this.sce.trustAsHtml(this.correct);
    this.wrongCode = this.sce.trustAsHtml(this.wrong);
    this.successAlert = true;
    this.dangerAlert = true;
    return this.intermediateSuccessAlert = true;
  };

  IntermediatesCtrl.prototype.correctCodeClick = function() {
    console.log("correctCode!");
    if (this.currentPage === 10) {
      this.intermediateSuccessAlert = false;
      return this.dangerAlert = true;
    } else {
      this.successAlert = false;
      this.dangerAlert = true;
      return this.intermediateSuccessAlert = true;
    }
  };

  IntermediatesCtrl.prototype.wrongCodeClick = function() {
    console.log("wrongCode!");
    this.dangerAlert = false;
    this.successAlert = true;
    return this.intermediateSuccessAlert = true;
  };

  return IntermediatesCtrl;

})();

IntermediateControllers.controller("IntermediatesCtrl", ["$scope", "$http", "$resource", "Code", "$sce", IntermediatesCtrl]);
