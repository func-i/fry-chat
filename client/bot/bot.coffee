class window.PreRenderer
  constructor: (plugins) ->
    @plugins = plugins

  render: (input) ->
    for plugin in @plugins
      input = plugin.run(input)
    
    input

notifications = new NotificationProcessor
window.preRenderer = new PreRenderer([notifications])
