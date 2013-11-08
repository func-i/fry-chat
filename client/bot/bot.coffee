class window.PreRenderer
  constructor: (plugins) ->
    @plugins = plugins

  render: (text, from) ->
    for plugin in @plugins
      text = plugin.run(text, from) if plugin.pattern().test(text)

    text

notifications = new NotificationProcessor
window.preRenderer = new PreRenderer([notifications])
