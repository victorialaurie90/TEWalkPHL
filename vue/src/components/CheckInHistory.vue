<template>
  <div class = "check-in">
    <div v-for="checkin in checkIns" v-bind:key="checkin.checkInId">
      <h3>{{checkin.locationName}}</h3>
      <p>Date and Time: {{checkin.dateTime}}</p>
    </div>
  </div>
</template>

<script>
import checkInService from '../services/CheckInService'

export default {
    name: "check-in-history",
    data() {
      return {
        checkIns: [],
        filteredCheckIns: []
      };
    },
    props: {
      'userId': Number
    },
    created() {
      this.retrieveCheckIns();
    },
    methods: {
      retrieveCheckIns() {
        checkInService.getCheckIns(this.$store.state.user.id)
        .then (response => {
          this.checkIns = response.data;
        });
      }
    }
}
</script>

<style scoped>

.check-in {
  display: flex;
  flex-direction: column;
  align-items: center;
}

</style>