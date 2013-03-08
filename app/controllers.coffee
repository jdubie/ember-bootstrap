#################################################
## CONTROLLERS
#################################################

App.ApplicationController = Em.Controller.extend
  currentUser: null

App.HomeController = Em.ArrayController.extend
  itemController: 'repo'

  #lookupItemController: function( object ) {
  #  if (object.get('isSpecial')) {
  #    return "special"; // use App.SpecialController
  #  } else {
  #    return "regular"; // use App.RegularController
  #  }
  #}

App.RepoController = Em.ObjectController.extend
  toits: 'moits'
  testP: 'wefwefwe'
  nameLength: (() ->
    console.log 'hyeaaa'
    @get('name').length + 'hey dude'
  ).property('name')
