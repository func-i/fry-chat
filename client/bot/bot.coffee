class window.PreRenderer
  constructor: (plugins) ->
    @plugins = plugins

  render: (post) ->
    for plugin in @plugins
      post.text = plugin.run(post.text, post.from) if plugin.pattern().test(post.text)

    post.text

notifications = new NotificationProcessor
window.preRenderer = new PreRenderer([notifications])
