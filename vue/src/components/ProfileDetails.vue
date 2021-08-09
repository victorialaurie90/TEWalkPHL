<template>
  <div class = "profile-information">
      <div>
        <div class = "information">
            <img src="https://images.squarespace-cdn.com/content/v1/55ef2da9e4b03f6e1ef0cd28/1578939384628-3X4UKTV4YQ8E4Z850J68/Rich_Seeds_Bevel%400.5x.png?format=750w" alt="placeholder image" id="picture">
            <h3>{{this.$store.state.user.username}}</h3>
        </div>
      </div>
      <div class="history">
      <div class = "check-ins">
          <h1 id="recent-check-ins-title">Recent Check-Ins</h1>
          <check-in-history class = "single-check-in" v-bind:user-id="$route.params.id"/>
      </div>
         <div class = "badges">
            <h1 id="badges-title"> Badges </h1>
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

/* .information {
    display: flex;
    flex-direction: column;
    align-items: center;
    border-radius: 20px;
    background: #AACCE1;
    margin-top: 20px;
    width: 50%;
    margin-bottom: 25px;
} */

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
    background: linear-gradient(to bottom, #5C9CC4 0%, #64749C 100%);
    width: 50%;
    border-radius: 20px;
    padding-bottom: 20px;
    margin-right: 30px;
}
.badges {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background: linear-gradient(to bottom, #5c9cc4 0%, #64749c 100%);
    width: 50%;
    border-radius: 20px;
    padding-bottom: 20px;
}

.single-check-in {
    width: 85%;
    box-shadow:
  0 2.8px 2.2px rgba(0, 0, 0, 0.034),
  0 6.7px 5.3px rgba(0, 0, 0, 0.048),
  0 12.5px 10px rgba(0, 0, 0, 0.06),
  0 22.3px 17.9px rgba(0, 0, 0, 0.072),
  0 41.8px 33.4px rgba(0, 0, 0, 0.086),
  0 100px 80px rgba(0, 0, 0, 0.12)
}

#recent-check-ins-title {
    color: transparent;
background: #ece0e0;
-webkit-background-clip: text;
-moz-background-clip: text;
background-clip: text;
text-shadow: 0px 3px 3px rgba(255,255,255,0.5);
}

#badges-title {
    color: transparent;
background: #ece0e0;
-webkit-background-clip: text;
-moz-background-clip: text;
background-clip: text;
text-shadow: 0px 3px 3px rgba(255,255,255,0.5);
}

h1 {
   font-size: 40px;
}


</style>