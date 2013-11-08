Meteor.startup( ->
  window.videoOptions = {
    constraints:
      audio: false
      video: true

    gifOptions:
        type: 'gif'
        video:
            width: '100'
            height: '100'
        canvas:
            width: '100'
            height: '100'
  }
)