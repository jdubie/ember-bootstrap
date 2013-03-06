#################################################
## VIEWS
#################################################

App.ApplicationView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')
  templateName: require 'templates/application'

App.HomeView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')
  templateName: require 'templates/home'

App.RepoView = Em.View.extend
  store: () ->
    this.get('repo').storeRepo()

App.ProfileView = Em.View.extend
  templateName: require('templates/profile')

App.NavbarView = Em.View.extend
  templateName: require 'templates/navbar'
