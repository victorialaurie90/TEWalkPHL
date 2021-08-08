<template>
<div class="list">
  <!-- From Tom: When page is reloaded, this is not staying updated. Potential bug. -->
  <!-- From Tom: Changed search header to relative position in order to contain it in the list and not have it cover up items on the list. -->
  <!-- From Tom: Put in DIV container to flex everything. -->
  <div>
    <div class="search-box">
      <input type="text" id="searchTextBox" v-on:keyup="freeTextSearch" placeholder="What do you want to do?">
    </div>
    <div>
    <h2 class="search-header">
      <span v-if="clickedSearchBox">Displaying results for: {{this.$store.state.searchText}}</span>
      <span v-if="clickedCategory">Displaying results for: {{this.$store.state.filterCriteria}}</span>
      <span v-if="clickedOpenNow">Current open locations:</span>
      <span v-if="searchedNearMe">Displaying Results for Lat/Long: {{this.$store.state.userLocation.lat}}, {{this.$store.state.userLocation.long}} (TO BE REPLACED BY 'LOCATIONS NEAR YOU')</span>
    </h2>
    </div>
  </div>
  <location-details class="deets" 
      v-for="loc in searchList"
      v-bind:key="loc.locationId"
      v-bind:location="loc"
  />
</div>
</template>
<script>
import LocationDetails from './LocationDetails.vue';

export default {
    name: "locations-list",
    components: {
        LocationDetails
    },
    methods: {
      freeTextSearch() {
      this.$store.state.filterCriteria = null;
      this.$store.state.timeNow = null;
      this.$store.state.userLocation.lat = 0;
      this.$store.state.userLocation.long = 0;
      let filter = document.getElementById('searchTextBox');
      this.$store.state.searchText = filter.value;
      this.$router.push({name:'search-result'})
      } 
    },
    computed: {
      clickedSearchBox() {
        return this.$store.state.searchText;
      },

      clickedCategory() {
        return this.$store.state.filterCriteria;
      },

      clickedOpenNow() {
        return this.$store.state.timeNow;
      },

      searchedNearMe() {
        return this.$store.state.userLocation.lat !== 0 && this.$store.state.userLocation.long !== 0;
      },
    


      searchList() {
        if (this.$store.state.filterCriteria) {
           return this.filteredLocations;
        } else if (this.$store.state.searchText) {
          return this.textSearchLocations;
        } else if (this.$store.state.timeNow) {
          return this.openNowLocations;
        } else if (this.$store.state.userLocation.lat) {
          return this.nearbyLocations;
        } else {
          return this.$store.state.locations;
        }
      },

      //if they clicked the category button do this: 
      filteredLocations() {
        const rawList = this.$store.state.locations;
        const filterCriteria = this.$store.state.filterCriteria;
        return rawList.filter(loc => {
          return loc.categories.includes(filterCriteria);
        })
      },

      textSearchLocations() {
        const rawList = this.$store.state.locations;
        const filterCriteria = this.$store.state.searchText;
        return rawList.filter(loc => {
           return filterCriteria.toLowerCase().split(' ').every(query => 
                  loc.categories.toLowerCase().includes(query) || 
                  loc.locationName.toLowerCase().includes(query) ||
                  loc.description.toLowerCase().includes(query)
                  );
        })
      },

      openNowLocations() {
        const rawList = this.$store.state.locations;
        const timeNow = this.$store.state.timeNow;
        return rawList.filter(loc => {
            return (loc.openFrom <= timeNow && loc.openTo >= timeNow) || (loc.openFrom == "00:00:00" && loc.openTo == "00:00:00");
        });   
      },

      nearbyLocations() {
          const rawList = this.$store.state.locations;
          const userLoc = this.$store.state.userLocation;

              let filteredList = [];

              rawList.forEach(loc => {  
              var radlat1 = Math.PI * userLoc.lat / 180;
              var radlat2 = Math.PI * loc.latitude / 180;
              var theta = userLoc.long - loc.longitude;
              var radtheta = Math.PI * theta/180;
              var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
              if (dist > 1) {
                 dist = 1;
               }
              dist = Math.acos(dist);
              dist = dist * 180/Math.PI;
              dist = dist * 60 * 1.1515;
              dist = dist * 1.609344;
              loc.distance = dist;

              if (loc.distance <=2) {
                filteredList.push(loc);
              }});

              return filteredList;
        }
    }
}
</script>

<style>
h2.search-header {
  background: #7C2D3E;
  color: white;
  margin: 0;
  position: relative;
  width: 100%;
}
div.list {
    width: 33%;
    height: 94.75vh;
    overflow-y: auto;
    position: relative;
    background:white;
    color: black;
    display: flex;
    flex-direction: column;
} 
::-webkit-scrollbar {
  background: white;
  width: 5px;
}
::-webkit-scrollbar-thumb {
  background: white;
  width: 10px;
  height: 200px
}
::-webkit-scrollbar-thumb:hover {
  background: grey;
}
#searchTextBox{
  width: 98%;
  height: 30px;
  font-size:25px
}
</style>