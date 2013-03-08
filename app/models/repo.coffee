c = require 'constants'

App.Repo = DS.Model.extend
  _id       : DS.attr 'string'
  name      : DS.attr 'string'
  ctime     : DS.attr 'date'

  # state
  progress  : DS.attr 'number'
  state     : DS.attr 'number' # { archived, storing, restoring, repo }
  isPrivate : DS.attr 'boolean' # public/private

  finishedStoring: () ->
    #if @get('state') is states.STORING
    #  @set('state', states.ARCHIVED)
    console.log 'here'
    @set('state', c.states.ARCHIVED)

  storeRepo: () -> # this.store is reserved
    if @get('state') is c.states.REPO
      @set('state', c.states.STORING)

