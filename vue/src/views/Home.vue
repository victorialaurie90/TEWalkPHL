<template>
  <div class="home">
    
    <h1>WLK - PHL</h1>
    <p>Find Your Next Favorite Jawn</p>
    <!-- <router-link :to= " { name: 'login'} "><button>Login</button></router-link> -->
    <div class="search-box">
    <form v-on:submit.prevent="submitSearch">
        <input type="text" placeholder="What do you want to do?">
        <button type="submit">Search</button>
    </form>
    <form v-on:click.prevent="searchByCategories">
        <button type="submit" v-on:click="searchByCategories">Bars</button>
    </form>
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
  props: ["categories"],
  data() {
    return {
      filteredLocations: [],
    };
  },
  computed: { 
  searchByCategories() {
    let filteredLocations = this.$store.state.locations.filter(
    location => { location.categories.includes(this.categories)
    })
    console.log(filteredLocations);
    return filteredLocations;
  }
  }
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

