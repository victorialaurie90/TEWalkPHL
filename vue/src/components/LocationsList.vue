<template>
  <div class="list">

    <div>
  <!-- Dyanmic search bar on search result pages is bugged; removed for now -->
  <!-- <div class="search-box">
          <i id="search-icon" class="fas fa-search"></i>
          <input type="text" id="searchTextBox" style="border-style: none" v-on:keyup="freeTextSearch" placeholder="What do you want to do?">
      </div> -->
      <div class="search-buttons">
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('Restaurants')"><i class="fas fa-utensils fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('Bars')"><i class="fas fa-beer fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('Sports')"><i class="fas fa-baseball-ball fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('Fine Arts')"><i class="fas fa-theater-masks fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('Historic Sites')"><i class="fas fa-landmark fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('Parks')"><i class="fas fa-tree fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('Indoor')"><i class="fas fa-home fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('Outdoor')"><i class="fas fa-cloud-sun fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="searchByIsOpen()"><i class="fas fa-clock fa-2x"></i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="searchNearMe()"><i class="fas fa-street-view fa-2x"></i></button>
      </div>

      <div class="return-search-menu" style="width: 100%; display: flex">
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="returnHome()"><i class="fas fa-search fa-2x"> Search Home</i></button>
        <button type="submit" class="locationListButtons" style="flex-grow: 2" v-on:click="applyNameToFilter('')"><i class="fas fa-search-location fa-2x"> Search All</i></button>
      </div>
      
      <div>
        
        <h2 class="search-header">
          <span v-if="clickedSearchBox">Displaying results for: {{this.$store.state.searchText}}</span>
          <span v-if="clickedCategory">Displaying results for: {{this.$store.state.filterCriteria}}</span>
          <span v-if="clickedOpenNow">Current open locations:</span>
          <span v-if="searchedNearMe">Locations near you:</span>
        </h2>
      
      </div>
    
    </div>

    <location-details class="deets" 
        v-for="loc in searchList"
        v-bind:key="loc.locationId"
        v-bind:location="loc" />

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
    calculateDistance() {
      const rawList = this.$store.state.locations;
      const userLoc = this.$store.state.userLocation;
  
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
          this.$store.state.filterLocation.push(loc);
          }});
  },

    returnHome() {
      this.$router.push({name:'home'})
    },

    applyNameToFilter(category) {
      this.resetSearchText();
      this.resetTimeNow();
      this.resetUserLocation();
      this.$store.commit('SET_FILTER_CRITERIA', category);
      this.$store.state.filterLocation = [];
      this.$store.state.locations.forEach((loc) => {
        if (loc.categories.includes(category)) {
          this.$store.state.filterLocation.push(loc);
          }
          });
      //this.$router.push({name: 'search-result'});
      },

    searchByIsOpen() {
      this.resetSearchText();
      this.resetFilterCriteria();
      this.resetUserLocation();

      this.$store.state.filterLocation = [];

      let today = new Date();
      let userCurrentTime = today.getHours() + ":" + today.getMinutes();
      this.$store.state.timeNow = userCurrentTime;

      this.$store.state.locations.forEach((loc) => {
        if ((loc.openFrom <= userCurrentTime && loc.openTo >= userCurrentTime) || (loc.openFrom == "00:00:00" && loc.openTo == "00:00:00")) {
          this.$store.state.filterLocation.push(loc);
        }
      });
      //this.$router.push({name: 'search-result'})
    },

    searchNearMe() {
      this.resetSearchText();
      this.resetTimeNow();
      this.resetFilterCriteria();

      this.$store.state.filterLocation = [];
      
      if (navigator.geolocation) {
        // Snapshot of this instance of the component captured in self variable
        let self = this;
        navigator.geolocation.getCurrentPosition(function(position) {
          let coordinates = [position.coords.latitude, position.coords.longitude];       
          self.$store.state.userLocation.lat = coordinates[0];
          self.$store.state.userLocation.long = coordinates[1];
          self.calculateDistance();

          //  self.$store.state.locations.forEach((loc) => {
          //    if (loc.distance <= 2) {
          //     self.$store.state.filterLocation.push(loc);
          //     }
          //   });
           //this.$router.push({name: 'search-result'});  
        });
      }
  },

    resetTimeNow() {
      this.$store.state.timeNow = null;
    },

    resetFilterCriteria() {
      this.$store.state.filterCriteria = null;
    },

    resetSearchText() {
      this.$store.state.searchText = null;
    },

    resetUserLocation() {
      this.$store.state.userLocation.lat = 0;
      this.$store.state.userLocation.long = 0;
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
        return this.$store.state.filterLocation;
      } else {
        return this.$store.state.locations;
      }
    },

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
      }
    }
}
</script>

<style>

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

h2.search-header {

  background: #7C2D3E;
  color: white;
  margin: 0;
  position: relative;
  width: 100%;

}

div.search-buttons {

  display:flex;
  flex-grow: 2;

}

div.locationListButtons {

  display: flex;
  font-size: 30px;
  flex-grow: 2;  

}

::-webkit-scrollbar {

  background: white;
  width: 5px;

}
::-webkit-scrollbar-thumb {

  background: grey;;
  width: 10px;
  height: 200px

}
::-webkit-scrollbar-thumb:hover {

  background: black;

}
div.search-box {

  display: flex;
  align-items: center;

}
#searchTextBox{

  flex-grow: 1;
  width: 98%;
  height: 30px;
  font-size:20px;

}
#search-icon{

  width: 15px;
  padding-right: 5px;
  padding-left: 2px;
  color: grey;

}

@media(max-width: 768px) {

  div.list {

    width: 100%;
    padding-left: 0;

  }

  #searchTextBox{

  width: 100%;
  padding: 0px;
  height: 30px;
  font-size:25px;

  }

}
</style>