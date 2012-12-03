angular.module('rmsc').factory('AlertsSvc', ['$log', ($log) ->

  $log.info 'Initializing AlertSvc...'

  AlertSvc =

    # Init Alerts object
    alerts: {}

    # Add new alert to object
    addAlert: (message, type) ->
      type ||= 'alert-attention'
      this.alerts[type] ||= []
      this.alerts[type].push message

    setAlerts: (alertsObj) ->
      angular.copy alertsObj, this.alerts

    # Clear all alerts
    clearAlerts: ->
      angular.copy {}, this.alerts

    # Clear alert by type
    clearAlertType: (type) ->
      delete this.alerts[type];

    # Proxy for custom alert methods
    customAlertProxy: (messages, type, clearAlerts) ->
      that = this
      if clearAlerts then this.clearAlerts()
      if angular.isArray messages
        msgs = messages
      else
        msgs =  [messages]
      angular.forEach msgs, (m) ->
        that.addAlert m, type

    # Convenince methods for custom alert types
    alertAttention: (messages, clearAlerts) -> # Yellow
      this.customAlertProxy messages, 'alert-attention', clearAlerts

    alertSuccess: (messages, clearAlerts) -> # Green
      this.customAlertProxy messages, 'alert-success', clearAlerts

    alertError: (messages, clearAlerts) -> # Red
      this.customAlertProxy messages, 'alert-error', clearAlerts

    alertInfo: (messages, clearAlerts) -> # Blue
      this.customAlertProxy messages, 'alert-info', clearAlerts

])