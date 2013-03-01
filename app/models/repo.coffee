App.Repo = DS.Model.extend
  _id       : DS.attr 'string'
  name      : DS.attr 'string'
  ctime     : DS.attr 'date'
  inFridge  : DS.attr 'boolean'
  isPrivate : DS.attr 'boolean' # public/private

  # move this into view?
  displayClass: (() ->
    if @get('inFridge')
      'span4 offset1'
    else
      'span4 offset7'
  ).property('inFridge')
