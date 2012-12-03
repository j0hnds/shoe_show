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
    .when('/coordinators/new',
      title: 'New Coordinator'
      action: 'coordinators:edit'
    )
    .when('/coordinators/:coordinator_id',
      title: 'Coordinator Record'
      action: 'coordinators:show'
    )
    .when('/coordinators/:coordinator_id/edit'
      title: 'Edit Coordinator'
      action: 'coordinators:edit'
    )
    .otherwise(
      title: 'Error!'
      action: 'error'
    )
    
])