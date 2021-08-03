<template>
  <div class = "profile-information">
      <div class = "information">
          <p>information</p>
          <badge-component class = "badge-component"/>
      </div>
      <div class = "check-ins">
          <check-in-history class = "single-check-in"/>
      </div>
  </div>
</template>

<script>
import BadgeComponent from './BadgeComponent.vue'
import CheckInHistory from './CheckInHistory.vue'

export default {
    name: "profile-details",
    components: { 
      BadgeComponent, 
      CheckInHistory },

}
</script>

<style scoped>

.profile-information {
    display: flex;
    width: 100%;
}

#picture {

}

.information {
    flex-grow: 1;
    background: green;
}

.check-ins {
    flex-grow: 2;
    background: yellow;
}

</style>