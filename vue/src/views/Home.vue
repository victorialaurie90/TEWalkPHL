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
    <div class="categories">

    </div>
  </div>
</template>

<script>
import searchService from "../services/SearchService";

export default {
  name: "home",
  data() {
    return {
      searchTerm: {
        text: ""
      }
    };
  },
  methods: {
    resetForm(){
      this.searchTerm = {};
    },
    submitSearch(searchTerm){
      searchService.getSearchResults(searchTerm);
      //TODO: change to search page results view/vue when built
      this.$router.push({name: "search-result"});
    }
  }
};
</script>
