angular.module('rmsc', [
  'directives.dynamicController',
  'directives.crudTitle',
  'services.data',
  'services.crud',
  'resources.coordinators'
])
###

  Add stuff to $rootScope here

###
angular.module('rmsc').run(($rootScope) ->
  # ?
)

if angular.isUndefined(String.capitalize)
  String.prototype.capitalize = ->
    "#{@charAt(0).toUpperCase()}#{@slice(1)}"

