<template>
  <div class = "check-in">
    <div v-for="checkin in checkIns" v-bind:key="checkin.checkInId">
      <div id="info">
          <h3>{{checkin.locationName}}</h3>
          <p>Date and Time: {{checkin.dateTime}}</p> 
      </div>

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
  background-color: #9F6172;
  border-radius: 20px;
  border: solid #DBCFD6 2px;
  transition: .2s;
}

#info {
  display: flex;
  flex-wrap: wrap;
}

.check-in:hover {
  background-color: #DBCFD6;
  border: solid #9F6172 2px;
  transition: .2s;
  transform: scale(1.1)
}

div.check-in div {
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  align-items: center;
}

</style>