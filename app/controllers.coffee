#################################################
## CONTROLLERS
#################################################

App.ApplicationController = Em.Controller.extend
  currentUser: null

App.HomeController = Em.ArrayController.extend
  itemController: 'field'

App.FieldController = Em.ObjectController.extend
  # Em.observer
  id: (() ->
    plotField.call(this, @get('points_'))
    #console.log(points)
  ).observes('points_', 'selected')

  toggleSelected: () ->
    if @get('selected') then @set('selected', false)
    else @set('selected', true)

plotField = (points) ->
  self = this

  @get('polygon')?.setMap(null)

  return unless points.length > 3

  coords = points.map (point) ->
    new google.maps.LatLng(point.lat, point.lng)

  # Construct the polygon
  # Note that we don't specify an array or arrays, but instead just
  # a simple array of LatLngs in the paths property
  field = new google.maps.Polygon
    paths: coords
    strokeColor: "#FFFF99"
    strokeOpacity: 0.5
    strokeWeight: 2
    fillColor: "#EF9B0F"
    fillOpacity: 0

  if @get('selected')
    field.fillOpacity = 0.5

  field.setMap(window.map)
  @set('polygon', field)

  google.maps.event.addListener field, 'click', (e) ->
    console.log('got click', self.get('_id'))
    self.toggleSelected()
