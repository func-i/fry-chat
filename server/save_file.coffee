
# TODO support other encodings:
# http://stackoverflow.com/questions/7329128/how-to-write-binary-data-to-a-file-using-node-js
 
Meteor.methods(
  saveFile: (blob, name, path, encoding) ->
    path = cleanPath(path)
    fs = __meteor_bootstrap__.require('fs')
    name = cleanName(name || 'file')
    encoding = encoding || 'binary'
    chroot = Meteor.chroot || 'public'

    # Clean up the path. Remove any initial and final '/' -we prefix them-,
    # any sort of attempt to go to the parent directory '..' and any empty directories in
    # between '/////' - which may happen after removing '..'
    path = chroot + (path ? '/' + path + '/' : '/')
    
    # TODO Add file existance checks, etc...
    fs.writeFile(path + name, blob, encoding, (err) ->
      if (err) 
        throw (new Meteor.Error(500, 'Failed to save file.', err))
      else 
        console.log('The file ' + name + ' (' + encoding + ') was saved to ' + path)     
    )     
 
    cleanPath = (str) ->
      if (str) 
        str.replace(/\.\./g,'').replace(/\/+/g,'').replace(/^\/+/,'').replace(/\/+$/,'')      
    
    cleanName = (str) ->
      str.replace(/\.\./g,'').replace(/\//g,'')
)