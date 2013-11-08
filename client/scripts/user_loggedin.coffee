Template.user_loggedin.events
  'click #logout': (ev, tmpl) ->
    Meteor.logout()