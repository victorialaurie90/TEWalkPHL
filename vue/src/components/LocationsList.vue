<template>
<div class="list">
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

      searchList() {
        if (this.$store.state.filterCriteria) {
           return this.filteredLocations;
        } else {
          return this.textSearchLocations;
        }
      },


      //if they clicked the categoy button do this: 
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
          return loc.categories.includes(filterCriteria);
        })
      }

      //if free text search, do this:

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
} 
</style>