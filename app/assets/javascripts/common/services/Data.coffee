###

  abaqis data access service

###
angular.module('services.data',[])
angular.module('services.data').factory('Data', ['$log', '$http', ($log, $http) ->

  $log.info 'Initializing Data...'

  (url) ->

    thenFactoryMethod = (httpPromise, successCallback=angular.noop, errorCallback=angular.noop, isArray=false) ->
      httpPromise.then(
        (response) ->
          if isArray
            result = []
            result.push(new Resource(resource)) for resource in response.data
          else
            result = new Resource(response.data)
          successCallback(result, response.status, response.headers, response.config)
        ,(response) ->
          errorCallback(undefined, response.status, response.headers, response.config)
          undefined
      )

    Resource = (data) ->
      angular.extend(@, data)

    Resource.all = (callback, errorCallback) ->
      Resource.query({}, callback, errorCallback)

    Resource.query = (params={}, successCallback, errorCallback) ->
      httpPromise = $http.get(url, params)
      thenFactoryMethod(httpPromise, successCallback, errorCallback, true)

    Resource.getById = (id, successCallback, errorCallback) ->
      httpPromise = $http.get("#{url}/#{id}")
      thenFactoryMethod(httpPromise, successCallback, errorCallback)

    # Instance methods

    Resource.prototype.$id = ->
      angular.isDefined(@id)

    Resource.prototype.$save = (successCallback, errorCallback) ->
      httpPromise = $http.post(url, @)
      thenFactoryMethod(httpPromise, successCallback, errorCallback)

    Resource.prototype.$update = (successCallback, errorCallback) ->
      httpPromise = $http.put("#{url}/#{@id}")
      thenFactoryMethod(httpPromise, successCallback, errorCallback)

    Resource.prototype.$remove = (successCallback, errorCallback) ->
      httpPromise = $http['delete']("#{url}/#{@id}")
      thenFactoryMethod(httpPromise, successCallback, errorCallback)

    Resource.prototype.$saveOrUpdate = (saveCallback, updateCallback, errorSaveCallback, errorUpdateCallback) ->
      if @$id()
        @$update(updateCallback, errorUpdateCallback)
      else
        @$save(saveCallback, errorSaveCallback)

    Resource

])