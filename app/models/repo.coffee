states =
  REPO      : 0
  STORING   : 1
  RESTORING : 2
  ARCHIVED  : 3

App.Repo = DS.Model.extend
  _id       : DS.attr 'string'
  name      : DS.attr 'string'
  ctime     : DS.attr 'date'

  # state
  state     : DS.attr 'number' # { archived, storing, restoring, repo }
  isPrivate : DS.attr 'boolean' # public/private

  storeRepo: () -> # this.store is reserved
    if @get('state') is states.REPO
      @set('state', states.STORING)

  # move this into view?
  containerClass: (() ->
    if @get('inFridge')
      'span5'
    else
      'span5 offset7'
  ).property('inFridge')

  buttonClass: (() ->
    result = 'btn pull-right'
    result += ' disabled' if @get('state') is states.STORING
    console.log @get('state')
    result
  ).property('state')
