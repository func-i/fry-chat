Meteor.publish "posts", ->
  Posts.find {},
    sort:
      createdAt: -1