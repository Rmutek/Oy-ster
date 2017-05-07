/* global Vue, google */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!'
    }, 
    mounted: function() {
      var chicago = {lat: 41.8781, lng: -87.6298};
      var oysterBah = {lat: 41.9000, lng: -87.6298};
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: chicago
      });
      var marker = new google.maps.Marker({
        position: chicago,
        map: map
      });
      var marker1 = new google.maps.Marker({
        position: oysterBah,
        map: map
      });
    }
  });
});
