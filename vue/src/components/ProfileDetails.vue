<template>
    
    <div class = "profile-information">
    
        <div class="badge-and-profile">
    
            <div class = "information">
                <img src="https://images.squarespace-cdn.com/content/v1/55ef2da9e4b03f6e1ef0cd28/1578939384628-3X4UKTV4YQ8E4Z850J68/Rich_Seeds_Bevel%400.5x.png?format=750w" alt="placeholder image" id="picture">
                <h2 style="color: white;">Welcome back, {{this.$store.state.user.username}}!</h2>
            </div>
    
            <div class = "badges">
                <h1 class="title"> Badges </h1>
                <badge-component v-bind:user-id="$route.params.id"/>
            </div>
    
        </div>
    
            <div class="history">
                <h1  class="title">Recent Check-Ins</h1>
                <check-in-history v-bind:user-id="$route.params.id"/>
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

div.profile-information { /* This is the total parent div */

    display: flex;
    width: 100%;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    margin: auto;
    

}

div.badge-and-profile { /* This is the information for the profile and badge component */

    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    transform: scale(.9);
    

}

div.information { /* Profile information container like image and username */

    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: linear-gradient(to bottom, #5C9CC4 0%, #64749C 100%);
    border-radius: 25px;
    margin-bottom: 20px;

}

div.information img { /* Targeting the image specifically in div with class .information */

    height: 200px;
    width: 200px;
    margin: 20px;
    border-radius: 100%;

}

div.badges { /* Badge component container */

    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 70%;
    align-items: center;
    margin-left: 0px;
    background: linear-gradient(to bottom, #5C9CC4 0%, #64749C 100%);
    border-radius: 25px;

}

div.history { /* Container for the check-in information */

    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    width: 70vw;
    height: 35vh;
    background: linear-gradient(to bottom, #5C9CC4 0%, #64749C 100%);
    border-radius: 25px;
    margin-top: -20px;
    margin-bottom: 20px;
    
}

.title {

    color: transparent;
    background: #ece0e0;
    -webkit-background-clip: text;
    -moz-background-clip: text;
    background-clip: text;

}

/* Below this is targetting specific elements */

h2 {

    color: transparent;
    background: #ece0e0;
    -webkit-background-clip: text;
    -moz-background-clip: text;
    background-clip: text; 
    
}

/* @Media Screen Section */

@media screen and (max-width: 550px) {

    div.information, div.badges { /* Targeting the image specifically in div with class .information */

        width: 100vw;

    }

    div.history {

        width: 90vw;

    }

}

</style>