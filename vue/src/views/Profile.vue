<template>
  <div class="profile_container">
    <profile-details v-bind:user-id="$route.params.id"/>
  </div>
</template>

<script>
import ProfileDetails from '../components/ProfileDetails.vue'
export default {
  name: "profile",
  components: {
    ProfileDetails
  },

}
</script>

<style>


</style>