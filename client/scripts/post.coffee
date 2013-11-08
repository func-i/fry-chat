Template.post.created = ->
  window.preRenderer.render(@.data)

Template.post.helpers(
  encodedSrc: (blob) ->
    console.log blob
    "data:image/png;base64," #+ encode64(blob)
)
