<template>
<div class="container">
  <div id='map' style='width: 100%; height: 94.75vh;'>
  </div>
</div>
</template>

<script>
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';
          
export default {
  name: "map-api",
  props: ['locations'],
  data() {
    return {
      map: {}
    }
  },

watch: {
filterCriteria: 
function() { 
this.loadMap();
},
timeNow:
function() { 
this.loadMap();
},
userLocation:
function() { 
this.loadMap();
}
},

  mounted() {
    this.loadMap();
  },
  methods: {
    loadMap() {
      let mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');
      mapboxgl.accessToken = 'pk.eyJ1IjoidG9tc2NvbnRlIiwiYSI6ImNrcnd4eG93eDBrenQybnFleHh6aXNhd3kifQ.tgzQgT1l3z4Bq7WpHQe3Wg';

      let map = this.map;

      map = new mapboxgl.Map({  
        container: 'map',
        center: [-75.1652, 39.9526],
        zoom: 11.15,
        attributionControl: false,
        style: 'mapbox://styles/mapbox/streets-v11'
      });

      const nav = new mapboxgl.NavigationControl();
      map.addControl(nav, "top-right");

      this.$store.state.filterLocation.forEach(location => {
        let time;
          if (location.openFrom == "00:00:00" && location.openTo == "00:00:00") {
            time = "Always Open";
          } else {
            time = "<p>Open from " + location.openFrom + " until " + location.openTo + "</p>"
          }
        const marker = new mapboxgl.Marker()
        .setLngLat([location.longitude, location.latitude])
        .setPopup(new mapboxgl.Popup({ offset: 25 })
          .setHTML('<h3>' + location.locationName + '</h3>' + time + '<p>' + location.description + '</p>'));
        marker.addTo(map);
      });

      const geolocate = new mapboxgl.GeolocateControl({
        positionOptions: {
            enableHighAccuracy: true
        },
        trackUserLocation: true
      });
      map.addControl(geolocate, "top-right")

      const directions = new MapboxDirections({
        accessToken: mapboxgl.accessToken
      });

      map.addControl(directions, "bottom-right")
    }
  },

  computed: {
filterCriteria() {
  return this.$store.state.filterCriteria;
},

timeNow() {
  return this.$store.state.timeNow;
},

userLocation() {
  return this.$store.state.filterLocation;
}
  }
}
</script>

<style>

@media(max-width: 768px) {
  

  div.container {
    background-color: #AACCE1;
    height: 300px;
    }
  
  /* Temporary, need to display directions properply */
    div.mapbox-directions-component-keyline {
    display: none;
    /* transform: scale(.66); */
  
  }

}

@media(max-width: 375px) {
  

  div.container {
    background-color: #AACCE1;
    height: 300px;
    }
  
  /* Temporary, removing directions to reduce screen clutter */
    div.mapbox-directions-component-keyline {
    display: none;
  } 

}
</style>