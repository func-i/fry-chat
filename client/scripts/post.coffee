Template.post.created = ->
  window.preRenderer.render(@.data)

Template.post.helpers(
  encodedSrc: (dataUrl) ->
    dataUrl.replace "data:image/gif;base64,", "data:image/gif;bogus:ABCDEF;base64,"
)
