<template>
  <div class="home">
    
    <h1>WLK - PHL</h1>
    <p>Find Your Next Favorite Jawn</p>
    <!-- <router-link :to= " { name: 'login'} "><button>Login</button></router-link> -->
    <div class="search-box">
    <form v-on:submit.prevent="freeTextSearch">
        <input type="text" id="filterText" placeholder="What do you want to do?">
        <button type="submit">Search</button>
    </form>
    <!-- Turn the button below into a simpler type button (not a form) -->
        <button type="submit" v-on:click="applyNameToFilter('Restaurants')">Restaurants</button>
        <button type="submit" v-on:click="applyNameToFilter('Bars')">Bars</button>
        <button type="submit" v-on:click="applyNameToFilter('Sports')">Sports</button>
        <button type="submit" v-on:click="applyNameToFilter('Fine Arts')">Fine Arts</button>
        <button type="submit" v-on:click="applyNameToFilter('Historic Sites')">Historic Sites</button>
        <button type="submit" v-on:click="applyNameToFilter('Parks')">Parks</button>
        <button type="submit" v-on:click="applyNameToFilter('Indoor')">Indoor</button>
        <button type="submit" v-on:click="applyNameToFilter('Outdoor')">Outdoor</button>
        
    </div>
    <!-- <div v-for='location in locations' v-bind:key="location.id">
      <h3>{{location.name}}</h3>
    </div> -->
    <!-- <div class="categories">

    </div> -->
  </div>
</template>

<script>
export default {
// TODO: Reconsider whether we still need searchTerm, resetForm, rename submitSearch() since
// filtering results will happen in JavaScript/front end
  components: {
    
  },
  name: "home",
  // props: ["categories"],
  data() {
    return {
      filteredLocations: [],
    };
  },
  methods: {

    applyNameToFilter(category) {
      this.$store.state.filterCriteria = category;
      this.$router.push({name: 'search-result'});
    },

    freeTextSearch() {
      this.$store.state.filterCriteria = null;
      let filter = document.getElementById('filterText');
      this.$store.state.searchText = filter.value;
      this.$router.push({name: 'search-result'});
    }


  }
  // computed: { 
  // searchByCategories() {
  //   let filteredLocations = this.$store.state.locations.filter(
  //   location => { location.categories.includes(this.categories)
  //   })
  //   console.log(filteredLocations);
  //   return filteredLocations;
  // }
  // }
};
</script>

<style scoped>

h1{
  font-size: 100px;
  display: flex;
  justify-content: center;
  margin-top:250px;
  margin-bottom: 5px;
}
p{
  font-size: 50px;
  display: flex;
  justify-content: center;
  align-items: center;
}
div.search-box{
  display: flex;
  justify-content: center;
  align-items: center;
}

</style>

