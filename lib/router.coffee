Router.map ->
  @route 'home',
    path: '/'
    template: 'home'
    waitOn: ->
      Meteor.subscribe('posts')
    data: ->
      posts: -> 
        Posts.find {},
          sort:
            createdAt: -1
      currentUsers: -> 
        Meteor.users.find {},
          sort:
            profile:
              login: -1

Router.configure
  layoutTemplate: 'layout',
  # notFoundTemplate: 'notFound',
  # loadingTemplate: 'loading'