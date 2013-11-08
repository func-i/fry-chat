Template.user_loggedout.events
  'click #login': (ev, tmpl) ->
    Meteor.loginWithGithub
      requestPermissions: ['user', 'user:email', 'public_repo', 'gist']