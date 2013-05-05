App = require 'app'
debug = require('debug') 'DEBUG router'

App.Router.map () ->
  @route 'home', { path: '/' }

App.HomeRoute = Em.Route.extend
  setupController: (controller) ->
    controller.set('content', App.store.findAll(App.Field))
