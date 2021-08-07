<template>
  <!-- <div class="list"> -->
    <div class="details">
        <!-- v-for="location in this.$store.state.locations"
        v-bind:key="location.id" -->
      <h3 id="location_name">{{location.locationName}}</h3>
      <ul id="to_and_from">
        <li id="open_from">Open From: {{location.openFrom}}</li> 
        <li id="open_to">Open To: {{location.openTo}}</li>
      </ul>
      <p id="category">Category: {{location.categories}}</p>
      <p id="address">Address: {{location.address}}</p>
      <p id="description">Description: {{location.description}}</p>
      <ul id="social_media">
          <li id="facebook">Facebook: {{location.facebook}}</li>
          <li id="url">Website: {{location.Website}}</li>
          <li id="twitter">Twitter: {{location.twitter}}</li>
      </ul>
      <button v-on:click="create" v-show="this.$store.state.isLoggedIn">{{location.locationId}}</button>
    </div>
  <!-- </div> -->
</template>

<script>
import checkInService from '../services/CheckInService.js'

export default {
    data() {
    return{
      checkIn: {
        locationId: 0,
        userId: 0,
      }
    }
  },
    name: "location-details",
    props: {
      ["location"]: Object,
    'userId': Number
    },
    methods: {
         create(){
        this.checkIn.locationId = this.location.locationId;
        this.checkIn.userId = this.$store.state.user.id;
        checkInService.createCheckIn(this.checkIn)
      }
    }
}
</script>

<style>
/* STYLE HERE IS VERY TEMPORARY. USED TO UNDERSTAND FLEX WITHIN COMPONENTS. */


/* div.list {
    width: 33%;
    height: 94.75vh;
    overflow-y: auto;
    position: relative;
    background:white;
    color: black;
}  */
div.details{
    border-top: solid 1px;
    border-bottom: solid 1px;
}
ul#to_and_from {
    display: flex;
    list-style: none;
    justify-content: flex-start;
    padding-left:0px;
}
#open_to {
    display: flex;  
}
#open_from{
    display: flex;
    padding-right: 15px; 
}

</style>