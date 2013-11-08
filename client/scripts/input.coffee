Template.input.events
  'keydown #text': (ev) ->
    if ev.which is 13 # if 'enter'
      ev.preventDefault()
      date = new Date
      time = date.getTime()
      recorder = window.RecordRTC(videoOptions.stream, videoOptions.gifOptions)

      # Delay the recording of the gif by 0.5 seconds
      setTimeout(
        () ->
          recorder.startRecording()
      , 500)

      setTimeout(
        () ->
          recorder.stopRecording((gifUrl) ->
            post =
              from:
                id: Meteor.userId()
                name: Meteor.user().profile.login
                avatar_url: Meteor.user().profile.avatar_url
                gifUrl: gifUrl
              text: text.value
              createdAt: time

            text.value = ""

            Posts.insert post
          )
      , 3000)