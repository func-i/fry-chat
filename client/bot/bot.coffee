class window.PreRenderer
  constructor: (plugins) ->
    @plugins = plugins

  render: (message) ->
    for plugin in @plugins
      message.content = plugin.run(message.content) if plugin.pattern.test(message.content)

    message

