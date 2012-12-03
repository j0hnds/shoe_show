angular.module('directives.crudTitle', [])
angular.module('directives.crudTitle').directive('crudTitle', ($compile, $controller) ->
  ($scope, $element, $attrs, $controller) ->
    record = $element.text()
    $scope.$watch($attrs.crudTitle, (value)->
      $element.text( ->
        if value then "Edit #{record}" else "Create #{record}"
      )
    )
)

# <tag abq-crud-conditional="" abq-crud-edit="" abq-crud-create="">
angular.module('directives.abqCrudConditional', [])
angular.module('directives.abqCrudConditional').directive('abqCrudConditional', ($compile, $controller) ->
  ($scope, $element, $attrs, $controller) ->
    $scope.$watch($attrs.abqCrudConditional, (value)->
      if value
        if $element.is('input')
          $element.val($attrs.abqCrudEdit)
        else
          $element.text($attrs.abqCrudEdit)
      else
        if $element.is('input')
          $element.val($attrs.abqCrudCreate)
        else
          $element.text($attrs.abqCrudCreate)
    )
)
