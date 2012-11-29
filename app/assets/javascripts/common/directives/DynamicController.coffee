angular.module('directives.dynamicController', [])
angular.module('directives.dynamicController').directive('dynamicController', ($compile, $controller) ->
  restrict: 'A'
  terminal: true
  link: (scope, element, attrs) ->
    lastScope = null
    scope.$watch(attrs.dynamicController, (ctrlName) ->
      lastScope.$destroy() unless !lastScope
      newScope = scope.$new()
      ctrl = $controller(ctrlName, {$scope: newScope})
      element.contents().data('$ngControllerController', ctrl)
      $compile(element.contents())(newScope)
      lastScope = newScope
    )
)
