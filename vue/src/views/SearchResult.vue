<template>
    <div class="search-results">
        <div class="locations-list-and-map">
            <locations-list />
            <map-api class="map-api"/>
        </div>
        <!-- <div class="footer">i'm div class="footer" in SearchResult.vue. Should I live in App.vue instead?
            <footer-bar />
        </div> -->
    </div>
</template>

<script>
import MapApi from '../components/MapApi.vue'
// import FooterBar from '../components/FooterBar.vue'
import LocationsList from '../components/LocationsList.vue'
import searchService from '../services/SearchService.js'

export default {
    name: 'search-result',
    components: { 
        LocationsList,
        MapApi,
        // FooterBar
    },
     created() {
    this.retrieveLocations();
    },
    methods: {
    retrieveLocations(){
      searchService.getLocations()
      .then(response => {
        this.$store.commit("SET_LOCATIONS", response.data);
        this.$router.push({name: "search-result"});
        })
      }
    },
    computed: {
        
    }
}
</script>

<style>
/* STYLE HERE IS VERY TEMPORARY. STYLE WAS USED TO UNDERSTAND WIDTH OF DIVS.  */

body {
    margin: 0;
    padding: 0;
    min-height: 100vh;
}

div.locations-list-and-map {
    display: flex;
    flex-grow: 1; 
    justify-content: center;
    justify-content: space-around;
    width: 100%;
    margin: 0; 
} 

/* .searchResults {
    display: flex;
    flex-grow: 1;
} */

.locations-list {
    flex-grow: 1;
    background-color: lightskyblue;
}

.map-api {
    flex-grow: 2;
    background-color: teal;
}


</style>