Accounts.onCreateUser (options, user) ->
  accessToken = user.services.github.accessToken
  result = Meteor.http.get("https://api.github.com/user",
    headers:
      "User-Agent": "Meteor/1.0"
    params:
      access_token: accessToken
  )
  throw result.error if result.error
  profile = _.pick(result.data, "name", "login", "avatar_url", "url", "company", "blog", "location", "email", "bio", "html_url")
  user.profile = profile
  user