<template>
<div>
  <div class="earnedBadges">
   <div v-for="userBadge in userBadges" :key="userBadge.badgeId">
      <div class = "badgeContainer">
        <img id = "bdgImg" :src="require(`../assets/badges/${userBadge.image}`)" >
        <div class="info">
          <h4>{{userBadge.badgeName}}</h4>
          <h4>{{userBadge.description}}</h4>
        </div>
      </div>
    </div>
  </div>
  <div class = "badge" >
      <div v-for="badge in allBadges" :key="badge.badgeId" >
        <div class = "badgeContainer" id='grr'>
          <img class = "unobtained" :src="require(`../assets/badges/${badge.image}`)" >
          <div class="info">
            <h3>{{badge.badgeName}}</h3>
            <h4>{{badge.description}}</h4>
            <button v-on:click="myFunction">click</button>
          </div>
        </div>
      </div>
  </div>
  </div>
</template>
<script>
import badgeService from '../services/BadgeService.js'
export default {
    name: "badge-component",
    data() {
      return {
        userBadges: [],
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
          this.userBadges = response.data;
         })
        },
        //getElementById targets first array element only
        //style.display = "none" removes element from view
         myFunction(){
         const element = document.querySelectorAll('#grr');
           element.display = "none";
         }
         }
    }
          //element.classList.remove("unobtained");
</script>
<style>
 .badge {
   display: flex;
   flex-direction: column;
 }
  .earnedBadge {
   display: flex;
   flex-direction: column;
 }
 img {
   border-radius: 50%;
   background: white;
   height: 150px;
   width: 150px;
   padding: 5px;
   margin: 10px;
 }
 .unobtained {
   filter: grayscale(100%)
 }
 .badgeContainer {
   display: flex;
   flex-direction: row;
   justify-content: flex-start;
   align-content: center;
 }
  .info {
   display: flex;
   flex-direction: column;
   margin-left: 20px;
 }
 h3{
   margin-bottom: 0;
 }
 h4{
   margin-top:0px;
 }
</style>