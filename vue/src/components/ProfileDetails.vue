<template>
  <div class = "profile-information">
      <div>
        <div class = "information">
            <img src="../assets/placeholder-200x200-300x300.png" alt="placeholder image" id="picture">
            <h3>{{this.$store.state.user.username}}</h3>
        </div>
      </div>
      <div class="history">
      <div class = "check-ins">
          <h3>Recent Check-Ins</h3>
          <check-in-history class = "single-check-in" v-bind:user-id="$route.params.id"/>
      </div>
         <div class = "badges">
            <h3> Badges </h3>
            <badge-component v-bind:user-id="$route.params.id"/>
            </div>
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
      CheckInHistory,
    },
    props: ["badge"],

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

.check-div {
    margin-bottom: 20px;
}

.information {
    display: flex;
    flex-direction: column;
    align-items: center;
    border-radius: 20px;
    background: #AACCE1;
    margin-top: 20px;
    width: 50%;
    margin-bottom: 25px;
}

.history {
    display: flex;
    flex-direction: row;
    width: 100%
}

.check-ins {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background-color: rgba(89, 154, 196);
    width: 50%;
    border-radius: 20px;
    padding-bottom: 20px;
}
.badges {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background-color: rgba(89, 154, 196);
    width: 50%;
    border-radius: 20px;
    padding-bottom: 20px;
}

.single-check-in {
    width: 85%;
}

</style>