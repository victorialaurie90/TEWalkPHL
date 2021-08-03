<template>
    <div class="search-results">
        <div class="location-details-and-map">
            <location-details class="location-details"/>
            <map-api class="map-api"/>
        </div>
        <div class="footer">
            <footer-bar />
        </div>
    </div>
</template>

<script>
import MapApi from '../components/MapApi.vue'
import FooterBar from '../components/FooterBar.vue'
import LocationDetails from '../components/LocationDetails.vue'

export default {
    name: 'search-result',
    components: { 
        LocationDetails,
        MapApi,
        FooterBar
    },
    // data() {
    //     return {
            
    //     }
    // }
}
</script>

<style>
/* STYLE HERE IS VERY TEMPORARY. STYLE WAS USED TO UNDERSTAND WIDTH OF DIVS.  */

body {
    margin: 0;
    padding: 0;
    min-height: 100vh;
}

div.location-details-and-map {
    display: flex;
    flex-grow: 1; 
    justify-content: center;
    justify-content: space-around;
    width: 1000px;
    margin: 0; 
} 

/* .searchResults {
    display: flex;
    flex-grow: 1;
} */

.location-details {
    flex-grow: 1;
    background-color: red;
}

.map-api {
    flex-grow: 1;
    background-color: fuchsia;
}


</style>