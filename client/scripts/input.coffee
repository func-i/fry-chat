Template.input.events
  'keydown #text': (ev) ->
    if ev.which is 13 # if 'enter'
      ev.preventDefault()
      date = new Date
      time = date.getTime()
      post =
        from:
          id: Meteor.userId()
          name: Meteor.user().profile.login
          avatar_url: Meteor.user().profile.avatar_url
        text: text.value
        createdAt: time

      text.value = ""

      Posts.insert post