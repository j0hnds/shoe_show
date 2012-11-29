###

    Application controller

###
angular.module('rmsc').controller('ApplicationCtrl', ['$log','$scope','$route','$routeParams', ($log,$scope,$route,$routeParams) ->

  $log.info 'Initializing ApplicationCtrl...'

  # Expose history.back() to $scope
  $scope.back = ->
    history.back()

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

