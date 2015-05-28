app.controller("HomeController", function ($scope, $http, $window) {
    $scope.zipCode = '';
    $scope.retailers = [];
    $scope.enableLocation = ('geolocation' in navigator);
    $scope.lat = 40.7637828;
    $scope.lng = -73.9859116;

    ///////////////////////////////////////////////////////////////////////////
    // Call Outs

    $scope.lookupLatLng = function () {
        $http({
            method: 'GET',
            url: 'https://maps.googleapis.com/maps/api/geocode/json',
            params: { components: 'postal_code:' + $scope.zipCode },
        }).success($scope.onGeocodeZipCode)
            .error($scope.onError);
    };

    $scope.executeSearch = function () {
        $http.get('/retailers.json', {
            params: { 'lat': $scope.lat, 'lng': $scope.lng },
        }).success($scope.onRetailers)
            .error($scope.onError);
    };

    ///////////////////////////////////////////////////////////////////////////
    // Callbacks

    $scope.onCurrentPosition = function (position) {
        $scope.lat = position.coords.latitude;
        $scope.lng = position.coords.longitude;
        $scope.executeSearch();
    };

    $scope.onRetailers = function (data, status, headers, config) {
        // If there are results, extract the latitude and longitude of the zip code's center
        if (data.retailers.length > 0) {
            $scope.retailers = data.retailers;
        }
        else
            $scope.onError(data);
    };

    $scope.onGeocodeZipCode = function (data, status, headers, config) {
        // If there are results, extract the latitude and longitude of the zip code's center
        if (data.results.length > 0) {
            var a = data.results[0].geometry.location;
            $scope.lat = a.lat;
            $scope.lng = a.lng;
            $scope.executeSearch();
        }
        else {
            alert('Could not locate zip code: ' + $scope.zipCode);
        }
    };

    $scope.onError = function (data) {
        alert('We apologize. We were unable to retrieve your results');
    };

    ///////////////////////////////////////////////////////////////////////////
    // Bound Methods

    $scope.retailerDetail = function (id) {
        $window.location = '#/retailer/' + id;
    };

    $scope.searchFromHere = function () {
        navigator.geolocation.getCurrentPosition($scope.onCurrentPosition);
    };

    $scope.searchForZip = function () {
        $scope.lookupLatLng();
    };

    ///////////////////////////////////////////////////////////////////////////
    // Initialize

    if ($scope.enableLocation) {
        $scope.searchFromHere();
    }
});
