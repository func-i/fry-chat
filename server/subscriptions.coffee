Meteor.publish "posts", ->
  Posts.find {},
    sort:
      createdAt: -1

Meteor.publish "currentUsers", ->
  Meteor.users.find
    fields:
      profile:
        login: -1