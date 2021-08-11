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
// import searchService from '../services/SearchService.js'

export default {
    name: 'search-result',
    props: ['locations']
    ,
    data() {
        return {
            
            }
    },    
    components: { 
        LocationsList,
        MapApi,
        // FooterBar
    },
     created() {
    // this.retrieveLocations();
    },
    methods: {
    // retrieveLocations(){
    //   searchService.getLocations()
    //   .then(response => {
    //     this.$store.commit("SET_LOCATIONS", response.data);
    //     this.$router.push({name: "search-result"});
    //     })
    //   }
    },

    
    // searchByKeyword() {},
    // searchByCurrentLocation() {},
    // searchByAvailableNow() {}
    // },
  
}
</script>

<style>

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

.locations-list {

    flex-grow: 1;
    background-color: lightskyblue;

}

.map-api {

    flex-grow: 2;
    background-color: teal;

}

@media(max-width: 768px) {
    div.locations-list-and-map {

        display: flex;
        flex-direction: column-reverse;
    
    }

    .map-api {

        display: flex;
        flex-direction: column;
        justify-content: center;
        transform: scale(1);

    }

    .locations-list {

        width: 100%;
        background-color: lightskyblue;

    }

}

</style>