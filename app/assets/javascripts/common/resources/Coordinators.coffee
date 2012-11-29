angular.module('resources.coordinators', [])

angular.module('resources.coordinators').factory('Coordinators', ['Data', (Data) ->

  Coordinators = Data('/coordinators.json')

  Coordinators

])