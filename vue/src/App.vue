<template>
  <div id="app">
    <div id="nav">
      <navigation-bar class="nav-bar"/>
      <!-- <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> -->
    </div>
    <router-view class="routerView"/>
  </div>
</template>

<script>
import NavigationBar from '@/components/NavigationBar.vue'
export default {
  components: {
    NavigationBar
  }
}
</script>

<style>
body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
    'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji',
    'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
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
  width: 79%;
  position: absolute;
  right: 0;
}

</style>