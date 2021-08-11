<template>
    <div class="navigation">

        <div class="topnav" @click="myFunction">
            
            <img src="../assets/WP-logo-large.png" alt="BigLogo" id="image"  style="width: 200px; margin: 0;" >  
            
            <div id="myLinks" style="display: none;">
                <router-link :to= " { name: 'home'} "><p @click="reset">Home<i class="fas fa-home"></i></p></router-link>
                <div>
                    <router-link :to=" { name: 'profile', params: { id: this.$store.state.user.id }} "><p @click="reset" v-show="this.$store.state.isLoggedIn">Profile<i class="fas fa-user"></i></p></router-link>
                </div>
                <router-link :to= " { name: 'logout'} "><p @click="reset" v-show="this.$store.state.isLoggedIn">Logout<i class="fas fa-sign-out-alt"></i></p></router-link> 
                <router-link :to= " { name: 'login'} "><p @click="reset" v-show="!this.$store.state.isLoggedIn">Login<i class="fas fa-sign-in-alt"></i></p></router-link> 
                <router-link :to= " { name: 'register'} "><p @click="reset" v-show="!this.$store.state.isLoggedIn">Register<i class="fas fa-user-plus"></i></p></router-link> 
            </div>
        
        </div>
        
    </div>

</template>

<script>
export default {
    name: 'navigation-bar',
    methods: {
        myFunction() {
            var x = document.getElementById("myLinks");
            if (x.style.display === "none") {
                x.style.display = "block";

            } else {
                x.style.display = "none";
            }
        },
        reset() {
            var x = document.getElementById("myLinks");
            x.style.display = "hidden"; 
        } 
    }
}
</script>

<style scoped>

.topnav { /* This is the conainter that holds all navigation information */

    background-color: #5C9CC4;
    overflow: hidden;
    position: relative;
    display: flex;
    align-items: center;
    flex-direction: column;
    padding-top: 5px;

}

.topnav:hover { /* Just changes the cursor to a pointer when over the top navigation menu */

    cursor: pointer;

}

#image { /* This is targetting the specific image element (The WALKPHILLY picture) */

    padding-bottom: 5px;

}

#myLinks { /* Hide the links inside the navigation menu (except for logo/home) */

    width: 100%;
    background-color: #9F6172;
    list-style: none;
    height: 7%;
    color: white;
    text-decoration: none;
    font-size: 17px;
    list-style: none;
    display: hidden;

}

p:hover { /* Changes border background and transition allows for fluid change on hover */

    background-color: #7C2D3E;
    transition: background-color .5s;

}

div#myLinks p { /* This targets the p elements in the div. Things like border, text color, and spacing */

    color: white;
    text-align: center;
    text-decoration: none;
    font-size: 17px;
    margin: 0;
    padding-top: 10px;
    padding-bottom: 10px;
    display: block;
    list-style: none;
    font-weight: bolder;
    border-bottom: solid white 1px;

}

i { /* This changes the color of the icon and creates some space between the text and icon */

    color: #AACCE1;
    margin-left: 5px;

}


</style>