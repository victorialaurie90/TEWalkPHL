<template>
  <!-- <div class="list"> -->
    <div class="details">
        <!-- v-for="location in this.$store.state.locations"
        v-bind:key="location.id" -->
      <h3 id="location_name">{{location.locationName}}</h3>
      <ul id="to_and_from">
        <li id="open_from"><span class="bold">Open From:</span><span class="space">{{location.openFrom}}</span></li> 
        <li id="open_to"><span class="bold">Open To:  </span><span class="space">{{location.openTo}}</span></li>
      </ul>
      <p id="category"><span class="bold">Category: </span> {{location.categories}}</p>
      <p id="address"><span class="bold">Address: </span> {{location.address}}</p>
      <p id="description"><span class="bold">Description: </span> {{location.description}}</p>
    <p id="social_media"> 
          <span id="facebook"><a v-bind:href="location.facebook"><i class="fab fa-facebook-square fa-2x"></i></a></span>
          <span id="twitter"><a v-bind:href="location.twitter"><i class="fab fa-twitter fa-2x"></i></a></span>
          <span id="url"><a v-bind:href="location.url"><i class="fas fa-globe fa-2x"></i></a></span>
      </p>
      <button class="check" v-on:click="create" v-show="this.$store.state.isLoggedIn">Click here to check in!</button>
    </div>
  <!-- </div> -->
</template>

<script>
import checkInService from '../services/CheckInService.js'
import badgeService from '../services/BadgeService.js'

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
        checkInService.createCheckIn(this.checkIn);
        badgeService.awardBadge(this.$store.state.user.id);
        
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
#location_name{
  margin: 10px;
}
#to_and_from{
  margin: 10px;
}
#category{
  margin: 10px;
}
#address{
  margin: 10px;
}
#description{
  margin: 10px;
}
#social_media{
 
}
#facebook{
  padding-left:10px;
}
#url{
  padding-left:10px;
}
#twitter{
  padding-left:10px;
}
.bold{
  font-weight: bold;
}
.space{
  text-indent: 5px;
}

a{
  color: #1D3557;
  text-decoration: none;
}
.check {
  margin-left: 10px;
  margin-bottom: 10px;
}





</style>