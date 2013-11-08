class window.NotificationProcessor
  pattern: ->
    new RegExp("@" + Meteor.user().profile.login,'i');

  run: (post) ->
    #Let's check if the browser supports notifications
    #return if !("Notification" in window)

    if Notification.permission == 'granted'
      notification = new Notification(post.from.name + " Says:", {
        body: post.text,
        icon: post.from.avatar_url
        })

    return post

$ ->
  $(window).on 'click', () ->
    if Notification.permission != 'denied'
      Notification.requestPermission (permission) ->
        #Whatever the user answers, we make sure Chrome stores the information
        Notification.permission = permission unless 'permission' in Notification
