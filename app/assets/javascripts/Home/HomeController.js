app.controller("HomeController", ['$scope', function ($scope) {
    $scope.zipCode = '';

    $scope.searchForZip = function () {
        $location.search({ zipCode: $scope.zipCode });
    };
}]);
