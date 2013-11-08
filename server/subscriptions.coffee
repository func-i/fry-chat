Meteor.publish "posts", ->
  Posts.find {},
    sort:
      created_at: -1