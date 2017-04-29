/* global Vue google */

document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!'
    },
    methods: {
      createMap: function() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8, 
          center: new google.maps.LatLng(41.875313, -87.624743),
        });
      } 
    }
  });
});
