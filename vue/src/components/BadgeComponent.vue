<template>
  <div class="all-badge">
    
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
    
    <div class = "unobtained-badges" >
      
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

    .all-badge { /* The upper-most container that holds all badges */

      display: flex;
      flex-direction: row;
      overflow-y: auto;
      width: 100%;
      padding-right: 20px;
      margin-right: 20px;
      transform: scale(.9);

    }

    .earnedBadges { /* The upper-most container that only holds completed badges */

      display: flex;
      flex-direction: row;

    }

    .badgeContainer { /* Shared-class div that deals with the spacing and how individual badges are shown next to one another  */

      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
      align-content: center; 
      border-radius: 20px;
      background-color: #DBCFD6;
      margin-bottom: 10px;
      margin-right: 20px;
      transform:scale(.9);
      height: 350px;
      
    }

    .badgeContainer:hover { /* This is when you hover on that badge, it is going to change colors and pop-out a bit */

      background-color: #866A83;
      color: #DBCFD6;
      border: solid #9F6172 2px;
      border: solid #DBCFD6 2px;
      transition: .2s;
      transform: scale(1);
      height: 350;
    
    }

    .unobtained-badges { /* The upper-most container that only holds non-completed badges */

      display: flex;
      flex-direction: row;
      opacity: .5;
    
    }

    #bdgImg { /* This shows the image of the badge */ 

      display: flex;
      justify-content: flex-start;
      border-radius: 50%;
      background: white;
      height: 150px;
      width: 150px;
      padding: 5px;
      margin: 10px;
      border: 8px solid maroon;
      /* box-shadow:
      0 2.8px 2.2px rgba(0, 0, 0, 0.034),
      0 6.7px 5.3px rgba(0, 0, 0, 0.048),
      0 12.5px 10px rgba(0, 0, 0, 0.06),
      0 22.3px 17.9px rgba(0, 0, 0, 0.072),
      0 41.8px 33.4px rgba(0, 0, 0, 0.086),
      0 100px 80px rgba(0, 0, 0, 0.12),  */

    }

    .unobtained { /* This controlls if the badge is unobtained. It basically just grayscales the image*/

      filter: grayscale(100%);
      border-radius: 50%;
      background: white;
      height: 150px;
      width: 150px;
      padding: 5px;
      margin: 10px;
      border: 8px solid maroon;
    }

    .info { /* Name and description styling */
      display: flex;
      flex-direction: column;
      margin-left: 20px;
      align-content: flex-end;
    }

    /* Specific tag styling */

    h3 {

      margin-bottom: 0;

    }

    h4 {

      margin-top:0px;

    }

    /* creating a more dynamic webpage with the max width and @media*/

    @media(max-width: 412px) {

      .all-badge, .badgeContainer {
        width: 90vw;
      }
      
    }
</style>