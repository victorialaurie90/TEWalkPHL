<template>
<div class="container">
  <div id='map' style='width: 100%; height: 94.75vh;' 
    v-for="location in this.$store.state.locations" 
    v-bind:key="location.id">
  </div>
</div>

</template>

<script>
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';

export default {
  name: "map-api",
  data() {
    return {
      locations: []
    }
  },
  mounted() {
    this.loadMap();
  },
  methods: {
    loadMap() {

      let mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');
      mapboxgl.accessToken = 'pk.eyJ1IjoidG9tc2NvbnRlIiwiYSI6ImNrcnd4eG93eDBrenQybnFleHh6aXNhd3kifQ.tgzQgT1l3z4Bq7WpHQe3Wg';

      let map = new mapboxgl.Map({  
        container: 'map',
        center: [-75.1652, 39.9526],
        zoom: 11.15,
        attributionControl: false,
        style: 'mapbox://styles/mapbox/streets-v11'
      });

//       map.addControl(
//       new MapboxDirections({
// accessToken: mapboxgl.accessToken
//       }),
//       'top-left'
//         );    

      
      // const dir = new mapboxgl.MapboxDirections({accessToken: mapboxgl.accessToken, unit: 'metric', profile: 'mapbox/walking'});
      // dir.addTo(map);

      const nav = new mapboxgl.NavigationControl();
      map.addControl(nav, "top-right");

      const marker = new mapboxgl.Marker({
        draggable: true
        })
        .setLngLat([-75.1652, 39.9526]);
        
      marker.addTo(map);


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

      return map;
    }
  }
}
</script>

<style>

/* div#map {
    background: coral;
} */

</style>