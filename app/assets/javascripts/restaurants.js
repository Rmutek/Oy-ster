/* global Vue, google, $ */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      restaurants: [],
      message: 'Hello Vue!'
    },
    methods: {
      initMap: function() {
  
  var broadway = {
    info: '<strong>Chipotle on Broadway</strong><br>\
          5224 N Broadway St<br> Chicago, IL 60640<br>\
          <a href="https://goo.gl/maps/jKNEDz4SyyH2">Get Directions</a>',
    lat: 41.976816,
    long: -87.659916
  };

  var belmont = {
    info: '<strong>Chipotle on Belmont</strong><br>\
          1025 W Belmont Ave<br> Chicago, IL 60657<br>\
          <a href="https://goo.gl/maps/PHfsWTvgKa92">Get Directions</a>',
    lat: 41.939670,
    long: -87.655167
  };

  var sheridan = {
    info: '<strong>Chipotle on Sheridan</strong><br>\r\
          6600 N Sheridan Rd<br> Chicago, IL 60626<br>\
          <a href="https://goo.gl/maps/QGUrqZPsYp92">Get Directions</a>',
    lat: 42.002707,
    long: -87.661236
  };

  var locations = [
      [broadway.info, broadway.lat, broadway.long, 0],
      [belmont.info, belmont.lat, belmont.long, 1],
      [sheridan.info, sheridan.lat, sheridan.long, 2],
    ];

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: new google.maps.LatLng(41.976816, -87.659916),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var infowindow = new google.maps.InfoWindow({});

  var marker, i;

  for (i = 0; i < locations.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      map: map
    });

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        infowindow.setContent(locations[i][0]);
        infowindow.open(map, marker);
      };
    })(marker, i));
  }
}
    }
  });

  var app2 = new Vue({
    el: '#app2',
    data: {
      restaurants: [],
      location: "____",
      ambiance: "_____",
      price: "______"
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
          var randomIndex = Math.floor((Math.random() * this.filteredRestaurants.length));
          console.log('huhhhh', randomIndex, this.filteredRestaurants[randomIndex]);
          return this.filteredRestaurants[randomIndex];
        } else {
          return {};
        }
      }
    }
  });

  var app3 = new Vue({
    el: '#app3',
    data: {
      restaurants: [],
      location: "____",
      ambiance: "_____",
      price: "______",
      sortAttribute: "name",
      filterAttribute: ""
    },
    mounted: function() {
      $.get("/api/v1/restaurants", function(responseData) {
        this.restaurants = responseData;
      }.bind(this));
    },
    methods: {
      setSortAttribute: function(inputAttribute) {
        this.sortAttribute = inputAttribute;
      },
      setFilterAttribute: function(input) {
        this.filterAttribute = input;
      }
    },
    computed: {
      sortedRestaurants: function() {
        // var sorted = this.restaurants.sort(function(quality1, quality2) {
        //   return quality1[this.sortAttribute] - quality2[this.sortAttribute];
        // }.bind(this)); 
        // console.log('sorted by ' + this.sortAttribute, sorted.map(function(rest) { return rest.name }));
        // return sorted;
        var sorted = _.sortBy(this.restaurants, this.sortAttribute);
        if (this.sortAttribute === 'name') {
          return sorted;
        } else {
          return sorted.reverse();
        }
      },
      filteredSpecials: function() {
        var filtered = this.restaurants.filter(function(specials) {
          return specials[this.filterAttribute].indexOf(this.filterAttribute) !== -1 ;
        }.bind(this));
        return filtered;
      }
    }
  });
});
