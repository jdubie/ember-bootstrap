#################################################
## CONTROLLERS
#################################################

c = require('constants')

App.ApplicationController = Em.Controller.extend
  currentUser: null

App.HomeController = Em.ArrayController.extend
  itemController: 'repo'

App.RepoController = Em.ObjectController.extend
  finishedStoring: () ->
    @get('model').finishedStoring()
  storeRepo: () ->
    @get('model').storeRepo()

    #console.log 'hereeerer'
    ##if @get('state') is states.STORING
    ##  @set('state', states.ARCHIVED)
    #console.log 'here'
    #@set('state', states.ARCHIVED)

  containerClass: (() ->
    switch @get('state')
      when c.states.ARCHIVED, c.states.RESTORING then 'span5'
      when c.states.REPO, c.states.STORING then 'span5 offset7'
  ).property('state')

  progressStyle: (() ->
    progress = @get('progress') * 100
    "style=\"width: #{progress}%;\""
  ).property('progress')

  progressVisible: (() ->
    @get('state') in [ c.states.STORING , c.states.RESTORING ]
  ).property('state')

  buttonClass: (() ->
    result = 'btn pull-right'
    result += ' disabled' if @get('state') is c.states.STORING
    result
  ).property('state')
