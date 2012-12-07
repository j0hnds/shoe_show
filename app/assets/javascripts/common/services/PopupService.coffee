angular.module('rmsc').factory('PopupService', ['$log', '$http', '$compile', ($log,$http,$compile) ->

  $log.info 'Initializing PopupService...'

  PopupService =

    getPopup: (create) ->
      if not @popupElement && create
        @popupElement = $('<div class="modal hide in"></div>')
        @popupElement.appendTo 'BODY'
      @popupElement

    compileAndRunPopup: (popup, $scope, $options) ->
      $compile(popup)($scope)
      popup.modal $options

    close: () ->
      $log.info "Closing the popup..."
      popup = @getPopup()
      popup.modal('hide') if popup

    alert: (title, text, buttonText, alertFunction, $scope, $options) ->
      text ||= 'Alert'
      buttonText ||= 'Ok'
      alertHTML = ''
      alertHTML += "<div class=\"modal-header\"><h1>#{title}</h1></div>" if title
      alertHTML += "<div class=\"modal-body\">#{text}</div>"
      alertHTML += "<div class=\"modal-footer\">"
      alertHTML += "<button class=\"btn\" ng-click=\"#{alertFunction}\">#{buttonText}</button" if alertFunction
      alertHTML += "<button class=\"btn\">#{buttonText}</button>" unless alertFunction
      alertHTML += "</div>"

      popup = @getPopup true

      popup.html alertHTML

      if not alertFunction
        $log.info "Setting up the alert function"
        popup.find(".btn").click ->
          $log.info "The click was pushed"
          PopupService.close()
          $log.info "The click was pushed after"

      @compileAndRunPopup popup, $scope, $options

    confirm: (title, actionText, actionButtonText, actionFunction, cancelButtonText, cancelFunction, $scope, $options) ->
      actionText ||= "Are you sure?"
      actionButtonText ||= "Ok"
      cancelButtonText ||= "Cancel"

      confirmHTML = ''
      confirmHTML += "<div class=\"modal-header\"><h1>#{title}</h1></div>" if confirmHTML
      confirmHTML += "<div class=\"modal-body\">#{actionText}</div>"
      confirmHTML += "<div class=\"modal-footer\">"
      confirmHTML += "<button class=\"btn btn-primary\" ng-click=\"#{actionFunction}\">#{actionButtonText}</button>" if actionFunction
      confirmHTML += "<button class=\"btn btn-primary\">#{actionButtonText}</button>" unless actionFunction
      confirmHTML += "<button class=\"btn btn-cancel\" ng-click=\"#{cancelFunction}\">#{cancelButtonText}</button>" if cancelFunction
      confirmHTML += "<button class=\"btn btn-cancel\">#{actionButtonText}</button>" unless cancelFunction
      confirmHTML += "</div>"

      popup = @getPopup true

      popup.html confirmHTML
      if not actionFunction
        popup.find(".btn-primary").click ->
          @close
      if not cancelFunction
        popup.find(".btn-cancel").click ->
          @close

      @compileAndRunPopup popup, $scope, $options

])