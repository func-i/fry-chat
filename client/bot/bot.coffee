class window.PreRenderer
  constructor: (plugins) ->
    @plugins = plugins

  render: (message) ->
    for plugin in @plugins
      message.text = plugin.run(message.text) if plugin.pattern.test(message.text)

    message

notifications = new NotificationProcessor
window.preRenderer = new PreRenderer([notifications])
