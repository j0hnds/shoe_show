###

    Application controller

###
angular.module('rmsc').controller('ApplicationCtrl', ['$log','$scope','$route','$routeParams', ($log,$scope,$route,$routeParams) ->

  $log.info 'Initializing ApplicationCtrl...'

  # Expose history.back() to $scope
  $scope.back = ->
    history.back()

  # Generic container for selected crud object
  $scope.crud_record = {}

  # Accept crud object from child controllers
  $scope.$on('selectRecord', (event, data) ->
    angular.copy(data, $scope.crud_record)
  )

  # Clear crud object
  $scope.$on('clearRecord', ->
    angular.copy({}, $scope.crud_record)
  )

  # Set page title
  $scope.$on(
    "$routeChangeSuccess", ($currentRoute, $previousRoute) ->
      $scope.title = $route.current.title
  )

  # Set application state
  $scope.$on(
    "$routeChangeSuccess", ($currentRoute, $previousRoute) ->

      actions = $route.current.action.split('.')
      $scope.state = {}
      folders = []

      for action,i in actions

        [resource, template] = action.split(':')
        folders.push(resource)

        tpl = "#{template||'index'}.tpl.html"

        path = "/templates/#{folders.join('/')}"

        $scope.state["level#{++i}"] =
          resource: resource
          controller: "#{resource.capitalize()}Ctrl"
          template: tpl
          path: path
          url: "#{path}/#{tpl}"

      $log.info($scope.state)
  )

])

