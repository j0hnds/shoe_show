angular.module('services.crud', [])
angular.module('services.crud').factory('crudEditMethods', ->

  (itemName, item, formName, successcb, errorcb) ->

    mixin = {}

    mixin[itemName] = item
    mixin["#{itemName}Copy"] = angular.copy(item)

    mixin.save = ->
      @[itemName].$saveOrUpdate(successcb, successcb, errorcb, errorcb)

    mixin.canSave = ->
      @[formName].$valid && !angular.equals(@[itemName], @["#{itemName}Copy"])

    mixin.revertChanges = ->
      @[itemName] = angular.copy(@["#{itemName}Copy"])

    mixin.canRevert = ->
      !angular.equals(@[itemName], @["#{itemName}Copy"])

    mixin.remove = ->
      if @[itemName].$id()
        @[itemName].$remove(successcb, errorcb)
      else
        successcb()

    mixin.canRemove = ->
      item.$id()

    ###
      Get the CSS classes for this item, to be used by the ng-class directive
      @param {string} fieldName The name of the field on the form, for which we want to get the CSS classes
      @return {object} A hash where each key is a CSS class and the corresponding value is true if the class is to be applied.
    ###
    mixin.getCssClasses = (fieldName) ->
      ngModelContoller = @[formName][fieldName]
      return {
        error: ngModelContoller.$invalid && ngModelContoller.$dirty
        success: ngModelContoller.$valid && ngModelContoller.$dirty
      }

    ###
     * Whether to show an error message for the specified error
     * @param {string} fieldName The name of the field on the form, of which we want to know whether to show the error
     * @param  {string} error - The name of the error as given by a validation directive
     * @return {Boolean} true if the error should be shown
    ###
    mixin.showError = (fieldName, error) ->
      @[formName][fieldName].$error[error]

    mixin

)

angular.module('services.crud').factory('crudListMethods', ['$location', ($location) ->

  (pathPrefix) ->

    mixin = {}

    mixin['new'] = ->
      $location.path("#{pathPrefix}/new")

    mixin['edit'] = (itemId) ->
      $location.path("#{pathPrefix}/#{itemId}")

    mixin

])