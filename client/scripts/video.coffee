Template.video.settings = 
  constraints: 
    audio: false
    video: true

Template.video.rendered = () -> 
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia
  Template.video.settings.video = document.querySelector('video')

  successCallback = (stream) ->
    window.stream = stream
    if window.URL
      Template.video.settings.video.src = window.URL.createObjectURL(stream)
    else
      Template.video.settings.video.src = stream
    
    # Start playing the video in the html5 video tag
    Template.video.settings.video.play()

  errorCallback = (error) ->
    console.log "navigator.getUserMedia error: ", error  
  
  navigator.getUserMedia(Template.video.settings.constraints, successCallback, errorCallback)

Template.video.events
  'click #record': (event, template) ->
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia
    options = {
      type: 'gif'
      video: {
          width: '100'
          height: '100'
      },
      canvas: {
          width: '100'
          height: '100'
      }
    }
    
    navigator.getUserMedia(
      Template.video.settings.constraints, 
      (stream) ->      
        recorder = window.RecordRTC(stream, options)
        recorder.startRecording()       

        setTimeout(
          () ->        
            recorder.stopRecording((gifUrl) ->
              window.open(gifUrl)
            )
        , 5000)
    )

    

    