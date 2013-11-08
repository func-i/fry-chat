
Template.video.rendered = () ->
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia
  videoOptions.video = document.querySelector('video')

  successCallback = (stream) ->
    videoOptions.stream = stream
    if window.URL
      videoOptions.video.src = window.URL.createObjectURL(stream)
    else
      videoOptions.video.src = stream

    # Start playing the video in the html5 video tag
    videoOptions.video.play()

  errorCallback = (error) ->
    console.log "navigator.getUserMedia error: ", error

  navigator.getUserMedia(videoOptions.constraints, successCallback, errorCallback)

# Template.video.events
#   'click #record': (event, template) ->
#     options = {
#       type: 'gif'
#       video: {
#           width: '100'
#           height: '100'
#       },
#       canvas: {
#           width: '100'
#           height: '100'
#       }
#     }

#     navigator.getUserMedia(
#       Template.video.settings.constraints,
#       (stream) ->
#         recorder = window.RecordRTC(stream, options)
#         recorder.startRecording()

#         setTimeout(
#           () ->
#             recorder.stopRecording((gifUrl) ->
#               window.open(gifUrl)
#             )
#         , 5000)
#     )



