App = require 'app'
debug = require('debug') 'DEBUG router'

#App.Route = Em.Router.extend
#  rootUrl: '/'
#  enableLogging: true
#  location: 'history'

App.Router.map (match) ->
  match('/').to('home')
  match('/profile').to('profile')

App.HomeRoute = Em.Route.extend
  setupControllers: (controller) ->
    controller.set('content', App.store.findAll(App.Repo))
