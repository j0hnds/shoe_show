# Alerts controller
angular.module('rmsc').controller('AlertsCtrl', ['$scope', '$log', 'AlertsSvc', ($scope, $log, AlertsSvc) ->

  $log.info 'Initializing AlertsCtrl...'

  $scope.AlertsSvc = AlertsSvc

  $scope.clearAlertType = (type) ->
    AlertsSvc.clearAlertType type

])
