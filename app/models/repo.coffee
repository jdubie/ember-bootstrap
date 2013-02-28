App.Repo = DS.Model.extend
  _id   : DS.attr 'string'
  name  : DS.attr 'string'
  ctime : DS.attr 'date'
  isPrivate : DS.attr 'boolean' # public/private
