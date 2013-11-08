Template.input.events
  'click button': (ev) ->
    ev.preventDefault()
    date = new Date
    time = date.getTime()
    post =
      from:
        id: Meteor.userId()
        name: Meteor.user().profile.name
        avatar_url: Meteor.user().profile.avatar_url
      text: text.value
      createdAt: time

    text.value = ""

    Posts.insert post