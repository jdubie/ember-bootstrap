#################################################
## VIEWS
#################################################

App.ApplicationView = Em.View.extend
  templateName: require 'templates/application'
  didInsertElement: ->

App.HomeView = Em.View.extend
  templateName: require 'templates/home'
  didInsertElement: ->
    myLatLng = new google.maps.LatLng(43.19957554056385, -96.35130086791992) # IOWA
    mapOptions =
      zoom: 14
      center: myLatLng
      mapTypeId: google.maps.MapTypeId.SATELLITE
    window.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)

App.NavbarView = Em.View.extend
  templateName: require 'templates/navbar'
