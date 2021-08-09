<template>
<div>
  <div class="earnedBadges">
   <div v-for="userBadge in userBadges" :key="userBadge.badgeId">
      <div class = "badgeContainer">
        <img id = "bdgImg" :src="require(`../assets/badges/${userBadge.image}`)" >
        <div class="info">
          <h3>{{userBadge.badgeName}}</h3>
          <h3>{{userBadge.description}}</h3>
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
        allBadges : [],
      }
      },
    props: {
      'userId': Number
    },
    created() {
        this.retrieveBadges();
        this.populateBadgeList();
    },
    methods: {
        retrieveBadges() {
        badgeService.getBadges(this.$store.state.user.id)
        .then (response => {
          this.userBadges = response.data;
         })
        },
        populateBadgeList(){
        badgeService.getAllBadges(this.$store.state.user.id)
        .then(response => {
          this.allBadges = response.data;
        });
      }
    }
}
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
 #bdgImg {
     display: flex;
  justify-content: flex-start;
   border-radius: 50%;
   background: white;
   height: 150px;
   width: 150px;
   padding: 5px;
   margin: 10px;
  /* box-shadow:
  0 2.8px 2.2px rgba(0, 0, 0, 0.034),
  0 6.7px 5.3px rgba(0, 0, 0, 0.048),
  0 12.5px 10px rgba(0, 0, 0, 0.06),
  0 22.3px 17.9px rgba(0, 0, 0, 0.072),
  0 41.8px 33.4px rgba(0, 0, 0, 0.086),
  0 100px 80px rgba(0, 0, 0, 0.12),  */
 }
 .unobtained {
   filter: grayscale(100%);
   border-radius: 50%;
   background: white;
   height: 150px;
   width: 150px;
   padding: 5px;
   margin: 10px;
 }
 .badgeContainer {
   display: flex;
   flex-direction: row;
   justify-content: flex-start;
   align-content: center; 
  border-radius: 20px;
  
  /* transition: .2s; */
 }

.badgeContainer:hover {
  background-color: #866A83;
  color: #DBCFD6;
  border: solid #9F6172 2px;
  border: solid #DBCFD6 2px;
  transition: .2s;
  transform: scale(1.1)
}

  .info {
   display: flex;
   flex-direction: column;
   margin-left: 20px;
   align-content: flex-end;
 }
 h3{
   margin-bottom: 0;
 }
 h4{
   margin-top:0px;
 }
</style>