angular.module('directives.modal', [])

angular.module('directives.modal').directive('ngPopup', (PopupService) ->
    restrict: 'A',
    link: ($scope, $element, $attrs) -> 
      ngPopupUrl = $attrs.ngPopupUrl
      # Could have custom or boostrap modal options here
      popupOptions = {}
      $element.bind.click ->
        PopupService.load ngPopupUrl, scope, popupOptions
)

angular.module('directives.modal').directive('ngConfirm', (PopupService) ->
  restrict: 'E',
  link: ($scope, $element, $attrs) ->
    # Could have custom or bootstrap modal options here
    popupOptions = {}
    $element.bind.click ->
      PopupService.confirm $attrs.title,$attrs.actionText,$attrs.actionButtonText,$attrs.actionFunction,$attrs.cancelButtonText,$attrs.cancelFunction,$scope,popupOptions
)

angular.module('directives.modal').directive('ngAlert', (PopupService) ->
  restrict: 'E',
  link: (scope, element, attrs) ->
    # Could have custom or bootstrap modal options here
    popupOptions = {}
    element.bind("click", ->
      PopupService.alert attrs.title, attrs.text, attrs.buttonText, attrs.alertFunction, scope, popupOptions
    )
)
