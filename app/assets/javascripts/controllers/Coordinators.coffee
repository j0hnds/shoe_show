###

  Coordinator list controller

###
angular.module('rmsc').controller('CoordinatorListCtrl',['$rootScope','$scope','Coordinators','$location', ($rootScope, $scope, Coordinators,$location) ->

  Coordinators.all(
    (response) ->
      $scope.coordinators = response
  )

  $scope.add = ->
    $location.path("#{$location.path()}/new")

])
