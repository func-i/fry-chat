class window.Gist
  pattern: (input) ->
    input.match(/^!gist /)

  run: (input) ->
    if @pattern(input)
      console.log input

