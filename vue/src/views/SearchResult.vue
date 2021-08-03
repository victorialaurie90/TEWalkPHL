<template>
    <div class="search_results">
        <div class="location_details_and_map">
            <location-details />
            <map-api />
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

/* body {
    margin: 0;
    padding: 0;
    min-height: 100vh;
}

div.location_details_and_map {
    display: flex;
    justify-content: center;
    width: 1000px;
    margin: 0;
}

location-details {
    flex-basis: 25%;
}

map-api {
    flex-basis: 75%;
} */


</style>