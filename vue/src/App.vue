<template>
  <div id="app">
    <div id="nav">
      <navigation-bar class="nav-bar"/>
      <!-- <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> -->
    </div>
    <div>
      <router-view class="routerView"/>
    </div>
  </div>
</template>

<script>
import searchService from '@/services/SearchService.js'
import NavigationBar from '@/components/NavigationBar.vue'

export default {
  components: {
    NavigationBar
  },
  created() {
    this.retrieveLocations();
  },
  methods: {
    retrieveLocations(){
      searchService.getLocations()
      .then(response => {
        this.$store.commit("SET_LOCATIONS", response.data);
        })
      },
  }
}
</script>

<style>
body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
    'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji',
    'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  background-image: url('~@/assets/PhilaMap.png');
  background-size: 100%;
}

#app {
  width: 100%;
  /* max-width: 1100px; */
  /* margin: 0 auto; */
}

/* BASED ON LECTURE FINAL DAY 17, THIS IS WHERE OUR LOADING GIF WILL LIVE */
/* .loading {
  display: flex;
  justify-content: center;
  align-items: center;
} */

.routerView {
  position: absolute;
  width: 100%;
}

</style>