Template.video.rendered = () ->
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia
  constraints =
    audio: false
    video: true

  video = document.querySelector('video')


  successCallback = (stream) ->
    window.stream = stream
    if window.URL
      video.src = window.URL.createObjectURL(stream)
    else
      video.src = stream
    video.play()

  errorCallback = (error) ->
    console.log "navigator.getUserMedia error: ", error

  navigator.getUserMedia(constraints, successCallback, errorCallback)

Template.video.events
  'click #record': (event, template) ->
    video = document.querySelector('video')
    canvas = document.querySelector('canvas')
    context = canvas.getContext('2d')
    # context.drawImage(video, 0, 0)

    # document.querySelector('img').src = canvas.toDataURL('image/webp')

    mediaRecorder = new MediaStreamRecorder(stream)
    mediaRecorder.mimeType = 'video/gif'
    mediaRecorder.videoWidth = 320
    mediaRecorder.videoHeight = 240

    mediaRecorder.ondataavailable = (blob) ->
      reader = new FileReader()
      reader.onload = (e) ->
        dataURL = e.target.result
        window.open dataURL

      reader.readAsDataURL blob

    mediaRecorder.start 3000
