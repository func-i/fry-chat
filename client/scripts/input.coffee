Template.input.events
  'keydown #text': (ev) ->
    if ev.which is 13 # if 'enter'
      ev.preventDefault()
      date = new Date
      time = date.getTime()
      recorder = window.RecordRTC(videoOptions.stream, videoOptions.gifOptions)
      #recorder.setDelay(0)

      # Delay the recording of the gif by 0.5 seconds
      setTimeout(
        () ->
          recorder.startRecording()
      , 500)

      setTimeout(
        () ->
          # Stop the recording
          recorder.stopRecording()

          # Get the base64 encoded url
          recorder.getDataURL (dataUrl) ->

            # Create the post
            post =
              from:
                id: Meteor.userId()
                name: Meteor.user().profile.login
                avatar_url: Meteor.user().profile.avatar_url
                gifUrl: dataUrl
              text: text.value
              createdAt: time

            text.value = ""

            Posts.insert post

      , 3000)