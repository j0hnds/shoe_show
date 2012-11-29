###

  Handle routes

###
angular.module('rmsc').config(['$routeProvider', ($routeProvider) ->

  $routeProvider
    .when('',
      title: 'Home'
      action: 'home'
    )
    .when('/home',
      title: 'Home'
      action: 'home'
    )
    .when('/coordinators',
      title: 'Coordinators'
      action: 'coordinators'
    )
    .otherwise(
      title: 'Error!'
      action: 'error'
    )
    
])