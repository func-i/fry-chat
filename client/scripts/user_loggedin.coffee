Template.user_loggedin.events
  'click #logout': (ev, tmpl) ->
    Meteor.logout()

Template.user_loggedin.helpers
  notCurrentUser: (id) ->
    id isnt Meteor.userId()