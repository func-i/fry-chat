Meteor.methods checkGithub: ->
  post = {
    "description": "the description for this gist",
    "public": true,
    "files": {
      "file1.txt": {
        "content": "String file contents"
      }
    }
  }
  Meteor.http.post "https://api.github.com/gists", { headers: { "User-Agent": "Meteor/1.0" }, params: post }
  #HTTP.call "POST", "http://api.github.com/gists", { headers: { "User-Agent": "Meteor/1.0" }, params: post }
