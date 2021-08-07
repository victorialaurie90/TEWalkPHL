<template>
<div class="list">
  <h2 class="search-header">
    <span v-if="clickedSearchBox">Displaying results for: {{this.$store.state.searchText}}</span>
    <span v-if="clickedCategory">Displaying results for: {{this.$store.state.filterCriteria}}</span>
    <span v-if="clickedOpenNow">Current open locations:</span>
  </h2>

  <location-details 
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


      searchList() {
        if (this.$store.state.filterCriteria) {
           return this.filteredLocations;
        } else if (this.$store.state.searchText) {
          return this.textSearchLocations;
        } else {
          return this.openNowLocations;
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
      }
    }
}

</script>

<style>
h2.search-header {
  background: #7C2D3E;
  color: white;
  margin: 0;
  position: fixed;
  width: 100%;
}

div.list {
    width: 33%;
    height: 94.75vh;
    overflow-y: auto;
    position: relative;
    background:white;
    color: black;
} 
</style>