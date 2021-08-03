<template>
  <div class="home">
    
    <h1>WLK - PHL</h1>
    <p>Fun Stuff Near You</p>
    <!-- <router-link :to= " { name: 'login'} "><button>Login</button></router-link> -->
    <div class="search-box">
      <form v-on:submit.prevent="submitSearch">
        <input type="text" placeholder="What do you want to do?" v-model="searchTerm.text">
        <button type="submit">Search</button>
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
import searchService from "../services/SearchService";

export default {
// TODO: Reconsider whether we still need searchTerm, resetForm, rename submitSearch() since
// filtering results will happen in JavaScript/front end
  name: "home",
  data() {
    return {
      searchTerm: {
        text: ""
      },
      locations: []
    };
  },
  methods: {
    resetForm(){
      this.searchTerm = {};
    },
    submitSearch(){
      searchService.getSearchResults()
      .then(response => {
        this.locations = response.data;
      });
      //TODO: change to search page results view/vue when built
      this.$router.push({name: "search-result"});
    }
  },
};
</script>


