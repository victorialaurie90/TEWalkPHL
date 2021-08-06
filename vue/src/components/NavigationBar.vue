<template>
    <div class="navigation">
        <!-- Simulate a smartphone / tablet -->
        <div class="mobile-container">
            <!-- Top Navigation Menu -->
            <div class="topnav">
                <div class="logo active">
                    <img src="../assets/WP-logo-large.png" alt="BigLogo" @click="myFunction" style="width: 150px; margin: 0;">
                </div>
                <div id="myLinks" style="display: none;">
                    <router-link :to= " { name: 'home'} "><p @click="reset">Home</p></router-link>
                    <router-link :to= " { name: 'profile'} "><p @click="reset" v-show="this.$store.state.isLoggedIn">Profile</p></router-link>
                    <router-link :to= " { name: 'logout'} "><p @click="reset" v-show="this.$store.state.isLoggedIn">Logout</p></router-link> 
                    <router-link :to= " { name: 'login'} "><p @click="reset" v-show="!this.$store.state.isLoggedIn">Login</p></router-link> 
                    <router-link :to= " { name: 'register'} "><p @click="reset" v-show="!this.$store.state.isLoggedIn">Register</p></router-link> 
                    <router-link :to= " { name: 'search-result'} "><p @click="reset">Search (TEST TO BE DELETED)</p></router-link>
                </div>
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
            x.style.display = "none"; 
    } 
    }
}
</script>

<style scoped>

 /* Style the navigation menu */
.topnav {
    overflow: hidden;
    background-color: #9F6172;
    position: relative;
    display: flex;
    justify-content: center;
    flex-direction: column;
}

.logo {
    flex-grow: 1;
    display: flex;
    justify-content: center;    
}

.logo img {
    padding-top: 5px;
    padding-left: 0px;
    padding-bottom: 5px;
    cursor: pointer;
}

/* Hide the links inside the navigation menu (except for logo/home) */
#myLinks {
    list-style: none;
    height: 7%;
    color: white;
    text-decoration: none;
    font-size: 17px;
    list-style: none;
}

p:hover {
    background-color: #7C2D3E;
    transition: background-color .5s;
}

.topnav a.a-active {
    color: white;
    text-decoration: none;
    font-size: 17px;
    display: block;
}


div#myLinks p {
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
    border-bottom: solid white 2px;
}

/* Style the hamburger menu */
.topnav a.icon {
    background: none;
    display: block;
    position: absolute;
    padding:0;
    right: 0;
    top: 0;
}

/* Style the active link (or home/logo) */
.active {
    background-color: #5C9CC4;
    color: white;
} 

</style>