app.controller("HomeController", function ($scope, $http) {
    $scope.zipCode = '';
    $scope.retailers = [];
    $scope.enableLocation = ('geolocation' in navigator);
    $scope.lat = 40.7637828;
    $scope.lng = -73.9859116;

    $scope.searchFromHere = function () {
        navigator.geolocation.getCurrentPosition($scope.currentPosition);
    }

    $scope.currentPosition = function(position) {
        $scope.lat = position.coords.latitude;
        $scope.lng = position.coords.longitude;
    }

    $scope.searchForZip = function () {
        $http.get('http://localhost:3000/retailers.json', {
            params: { components: 'postal_code:' + $scope.zipCode },
        }).success($scope.geocodeResultPostalCode)
          .error(function (data) { alert('doh'); });
    };

    $scope.geocodeResultPostalCode = function (data, status, headers, config) {
        // If there are results, extract the latitude and longitude of the zip code's center
        if (data.retailers.length > 0) {
            $scope.retailers = data.retailers;
            console.log($scope.retailers);
        }
        else {
            alert('Could not locate zip code: ' + $scope.zip);
        }
    };
});
