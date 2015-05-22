app.controller("RetailerController", ['$scope', '$routeParams', '$resource', '$location', function ($scope, $routeParams, $resource, $location) {
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
      }));
  } else {
      $scope.retailer = {};
  }
  $scope.home = function () {
      return $location.path("/");
  };

  window.scope = $scope;
}]);