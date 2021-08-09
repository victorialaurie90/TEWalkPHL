<template>
  <div class = "profile-information">
      <div>
        <div class = "information">
            <img src="https://images.squarespace-cdn.com/content/v1/55ef2da9e4b03f6e1ef0cd28/1578939384628-3X4UKTV4YQ8E4Z850J68/Rich_Seeds_Bevel%400.5x.png?format=750w" alt="placeholder image" id="picture">
            <h2>Welcome back, {{this.$store.state.user.username}}!</h2>
        </div>
      </div>
      <div class="history">
      <div class = "check-ins-container">
          <h1 id="check-ins-container-title">Recent Check-Ins</h1>
          <check-in-history class = "check-in-history" v-bind:user-id="$route.params.id"/>
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

div.information {
    display: flex;
    flex-direction: column;
    align-items: center;
    border-radius: 20px;
    /* background: #AACCE1; */
    margin-top: 20px;
    width: 100%;
    margin-bottom: 25px;
}

.history {
    display: flex;
    flex-direction: row;
    justify-content: center;
    width: 100%
}

.check-ins-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background: linear-gradient(to bottom, #5C9CC4 0%, #64749C 100%);
    width: 35%;
    border-radius: 20px;
    padding-bottom: 20px;
    margin-right: 30px;
     align-self: flex-start;
    /* this below is what makes the div shorter than the other. we can change this */
}

.badges {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background: linear-gradient(to bottom, #5c9cc4 0%, #64749c 100%);
    width: 35%;
    border-radius: 20px;
    padding-bottom: 20px;
}

.check-in-history {
    width: 85%;
    /* box-shadow:
  0 2.8px 2.2px rgba(0, 0, 0, 0.034),
  0 6.7px 5.3px rgba(0, 0, 0, 0.048),
  0 12.5px 10px rgba(0, 0, 0, 0.06),
  0 22.3px 17.9px rgba(0, 0, 0, 0.072),
  0 41.8px 33.4px rgba(0, 0, 0, 0.086),
  0 100px 80px rgba(0, 0, 0, 0.12) */
}

#check-ins-container-title {
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