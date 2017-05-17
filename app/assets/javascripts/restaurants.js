/* global Vue, google, $ */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      restaurants: [],

      message: 'Hello Vue!'
    },
    mounted: function() {
      $.get("api/v1/restaurants", function(responseData) {
        this.restaurants = responseData;

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 10,
          center: new google.maps.LatLng(41.8753, -87.6247),
        });

        var markers = [];
        for (var i = 0; i < this.restaurants.length; i++) {
          var restaurant = this.restaurants[i];
          var textBoxOne = "<div>" + restaurant.name + "<p>" + restaurant.about + "</p>" + "</div>";
          var pin = [textBoxOne, restaurant.lat, restaurant.long];
          markers.push(pin);
        }

        var infowindow = new google.maps.infowindow({});

        var marker;

        for (i = 0; i < markers.length; i++) {
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(markers[i][1], markers[i][2]),
            map: map
          });
          google.maps.event.addListener(marker, 'click', function(marker,i) {
            return function() {
              infowindow.setContent(marker[i][0]);
              infowindow.open(map, marker);
            };
          })(marker, i);
        }
      }.bind(this));
    },
    computed: {
      filteredRestaurants: function() {
        var enteredLocation = this.location;
        var filtered = this.restaurants.filter(function(restaurant) {
          var dbLocation = restaurant.neighborhood;
          return dbLocation.indexOf(enteredLocation) !== -1;
        });
        return filtered;
      }
    }
  });

  var app2 = new Vue({
    el: '#app2',
    data: {
      restaurants: [],
      location: "____",
      ambiance: "_____",
      price: "______",
    },
    mounted: function() {
      $.get("/api/v1/restaurants", function(responseData) {
        this.restaurants = responseData;
      }.bind(this));
    },
    computed: {
      filteredRestaurants: function() {
        var enteredLocation = this.location;
        var enteredAmbiance = this.ambiance;
        var enteredPrice = this.price;

        var filteredLocation = this.restaurants.filter(function(restaurant) {
          var dbLocation = restaurant.neighborhood;
          return dbLocation === enteredLocation;
        }).filter(function(restaurant) {
          var dbAmbiance = restaurant.guests;
          return dbAmbiance === enteredAmbiance;
        }).filter(function(restaurant) {
          var dbPrice = restaurant.price;
          // return dbPrice.indexOf(enteredPrice) !== -1;
          return dbPrice === enteredPrice;
        });
        console.log('filtered is', filteredLocation);

        return filteredLocation;
      },
      randomFilteredRestaurant: function() {
        // return {};
        if (this.filteredRestaurants.length > 0) {
          var randomIndex = 0;
          return this.filteredRestaurants[randomIndex];
        } else {
          return {};
        }
      }
    }
  });
});
