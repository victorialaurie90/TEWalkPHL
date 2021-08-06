<template>
  <div class = "profile-information">
      <div class = "information">
          <img src="../assets/placeholder-200x200-300x300.png" alt="placeholder image" id="picture">
          <h3>{{this.$store.state.user.username}}</h3>
          <badge-component class = "badge-component"/>
      </div>
      <div class = "check-ins">
          <top-check-ins />
          <check-in-history class = "single-check-in" v-bind:user-id="$route.params.id"/>
      </div>
  </div>
</template>

<script>
import BadgeComponent from './BadgeComponent.vue'
import CheckInHistory from './CheckInHistory.vue'
import TopCheckIns from './TopCheckIns.vue'

export default {
    name: "profile-details",
    components: { 
      BadgeComponent, 
      CheckInHistory,
      TopCheckIns },
    props: {
      'userId': Number
    },
}
</script>

<style scoped>

.profile-information {
    display: flex;
    flex-direction: column;
    width: 100%;
    align-items: center;
}

#picture {
    height: 200px;
    width: 200px;
    margin: 20px;
    border-radius: 50%;
}

.information {
    display: flex;
    flex-direction: column;
    align-items: center;
    border-radius: 20px;
    background: #AACCE1;
    margin-top: 20px;
    width: 20%;
    margin-bottom: 25px;
}

.check-ins {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: rgba(89, 154, 196);
    width: 33%;
    border-radius: 20px;
}

</style>