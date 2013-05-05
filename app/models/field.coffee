App.Field = DS.Model.extend
  _id       : DS.attr 'string'
  points    : DS.attr 'string'
  selected  : DS.attr 'boolean'

  points_   : (() ->
    return JSON.parse(@get('points'))
  ).property('points')
