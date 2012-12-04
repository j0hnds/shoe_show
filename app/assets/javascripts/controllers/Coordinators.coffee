###

  Coordinator list controller

###
angular.module('rmsc').controller('CoordinatorListCtrl',['$rootScope','$scope','Coordinators','$location', ($rootScope, $scope, Coordinators,$location) ->

  Coordinators.all(
    (response) ->
      $scope.coordinators = response
  )

  # Load create coordinator form

  $scope.add = ->
    $location.path("#{$location.path()}/new")

])

angular.module('rmsc').controller('CoordinatorListDetailCtrl',['$rootScope', '$scope', '$location', ($rootScope, $scope, $location) ->

  # Load the show user screen

  $scope.show = ->
    $location.path("#{$location.path()}/#{$scope.coordinator.id}")

])


angular.module('rmsc').controller('CoordinatorDetailCtrl',['$log','$rootScope','$scope','$location','Coordinators','$routeParams',($log,$rootScope, $scope, $location,Coordinators,$routeParams) ->

  $log.info("coordinator id: " + $routeParams.coordinator_id)

  # Set the coordinator object
  if $routeParams.coordinator_id
    $log.info("Pulling coordinator from server")
    # pull from server
    Coordinators.getById($routeParams.coordinator_id,
      (response) ->
        $scope.coordinator = response
    )
  else
    $log.info("Creating a blank coordinator")
    # create a blank coordinator
    $scope.coordinator = new Coordinators()

  # Return to previous screen

  $scope.cancel = ->
    $scope.back()

  $scope.save = ->
    $scope.coordinator.$saveOrUpdate(
      (response) -> # success create callback
        # success message
        $scope.back()
        # history.back()
      ,(response) -> # success update callback
        $scope.back()
      ,(response) -> # error create callback
        $log.info("Error creating the thing")
      ,(response) -> # error update callback
        # error message
        $log.info("Error updating the thing")
    )

])