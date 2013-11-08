class window.NotificationProcessor
  pattern: ->
    "@" + Meteor.user().profile.login

  run: (message) ->
    #Let's check if the browser supports notifications
    #return if !("Notification" in window)

    if Notification.permission == 'granted'
      notification = new Notification("XXX Says:", {
        body: "BLAH BLAH",
        icon: "http://i.stack.imgur.com/dmHl0.png"
        })

$ ->
  $(window).on 'click', () ->
    if Notification.permission != 'denied'
      Notification.requestPermission (permission) ->
        #Whatever the user answers, we make sure Chrome stores the information
        Notification.permission = permission unless 'permission' in Notification
