<template>
    <div class="navigation">
        <!-- <nav>
            <p class="testing">{{this.$store.state.user.username}}</p>
            <ul class = "list">
                <router-link :to= " { name: 'home' } "><li>Home</li></router-link>
                <router-link :to= " { name: 'profile'} "><li v-if = "isLoggedIn">Profile</li></router-link>
                <router-link :to= " { name: 'logout'} "><li v-if = "isLoggedIn">Logout</li></router-link> 
                <router-link :to= " { name: 'login'} "><li v-if = "isLoggedIn">Login</li></router-link> 
                <router-link :to= " { name: 'register'} "><li v-if = "isLoggedIn">Register</li></router-link> 
                <router-link :to= " { name: 'search-result'} "><li>Search (TEST TO BE DELETED)</li></router-link>
            </ul>
        </nav> -->

        <!-- Simulate a smartphone / tablet -->
        <div class="mobile-container">
            <!-- Top Navigation Menu -->
            <div class="topnav">
                <div class="logo active">
                    <img src="../assets/WP-logo-large.png" alt="BigLogo" @click="myFunction" style="width: 150px; margin: 0;">
                </div>
                <div id="myLinks">
                        <router-link :to= " { name: 'home'} "><p @click="reset">Home</p></router-link>
                        <router-link :to= " { name: 'profile'} "><p @click="reset">Profile</p></router-link>
                        <router-link :to= " { name: 'logout'} "><p @click="reset">Logout</p></router-link> 
                        <router-link :to= " { name: 'login'} "><p @click="reset">Login</p></router-link> 
                        <router-link :to= " { name: 'register'} "><p @click="reset">Register</p></router-link> 
                        <router-link :to= " { name: 'search-result'} "><p @click="reset">Search (TEST TO BE DELETED)</p></router-link>
                </div>
                <!-- <div class="logo">
                    <a href="javascript:void(0);" class="icon" @click="myFunction">
                        <img src="../assets/WP-logo-64.png" alt="Logo" style="width: 41px; padding-right:10px; padding-left: 10px; border: solid white 5px;">
                    </a>
                </div> -->
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'navigation-bar',
    computed: {
        isLoggedIn() {
            return this.$store.state.user.username !== '';
        }
    },
    methods: {
    myFunction() {
        var x = document.getElementById("myLinks");
        if (x.style.display === "block") {
            x.style.display = "none";
        } else {
            x.style.display = "block";
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
    display: block;
    list-style: none;
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

/* .navigation {
    background-color: black;
}

ul {
    list-style: none;
    margin: 0%;
    padding: 0%;
    overflow: hidden;
}

p {
    margin: 0;
}

li {
 display: block;
 color: white;
 text-align: center;
 padding: 14px 16px;
 text-decoration: none;
 float: right;
}

li:hover {
    background-color: black;
}

.testing {
    color: white;
} */

</style>