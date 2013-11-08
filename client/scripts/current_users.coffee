Template.currentUsers.helpers

  anyOtherUsers: (currentUsers) ->
    for user in currentUsers
      return true if user._id is Meteor.userId()

  notCurrentUser: (id) ->
    id isnt Meteor.userId()