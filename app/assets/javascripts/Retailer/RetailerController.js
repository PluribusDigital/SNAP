app.controller("RetailerController", ['$scope', '$routeParams', '$resource', function ($scope, $routeParams, $resource) {
  var Retailer;
  Retailer = $resource('/retailers/:id', {
      id: "@id",
      format: 'json'
  });
  if ($routeParams.id) {
      Retailer.get({
          id: $routeParams.id
      }, (function (retailer) {
          return $scope.retailer = retailer;
      }), (function (httpResponse) {
          $scope.retailer = null;
          return flash.error = "Sorry, Retailer Not Found!";
      }));
  } else {
      $scope.retailer = {};
  }
  window.scope = $scope;
}]);