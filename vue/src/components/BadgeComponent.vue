<template>
<div>
  <div class = "badge"> 
  <div v-for="parentBadge in allBadges" :key="parentBadge.badgeId">
    <h3>{{parentBadge.badgeName}}</h3>
    <h4>{{parentBadge.description}}</h4>
    </div>
  </div>
  </div>
  <!-- 
  <div v-for="userBadge in badges" :key="userBadge.badgeId">
  <h4>{{userBadge.badgeName}}</h4>
  <h4>{{userBadge.description}}</h4>
      </div>
    -->
  
</template>

<script>
import badgeService from '../services/BadgeService.js'

export default {
    name: "badge-component",
    data() {
      return {
        badges: [],
        allBadges : this.$store.state.allBadges,
      }
      },
    props: {
      'userId': Number
    },
    created() {
        this.retrieveBadges();
    },
    methods: {
        retrieveBadges() {
        badgeService.getBadges(this.$store.state.user.id)
        .then (response => {
          this.badges = response.data;
        })
        }
}
    }

</script>

<style>

</style>