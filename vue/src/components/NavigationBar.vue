<template>
  <div class="navigation">
    <!-- Simulate a smartphone / tablet -->
    <div class="mobile-container">
      <!-- Top Navigation Menu -->
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
            <router-link :to= " { name: 'search-result'} "><p @click="reset">Search (TEST TO BE DELETED)<i class="fas fa-search"></i></p></router-link>
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
            x.style.display = "hidden"; 
    } 
    }
}
</script>

<style scoped>

 /* Style the navigation menu */
.topnav {
    background-color: #5C9CC4;
    overflow: hidden;
    position: relative;
    display: flex;
    align-items: center;
    flex-direction: column;
    padding-top: 5px;

}

.topnav:hover {
    cursor: pointer;
}

.topnav a.a-active {
    color: white;
    text-decoration: none;
    font-size: 17px;
    display: block;
}

#image {
    padding-bottom: 5px;
}
/* Hide the links inside the navigation menu (except for logo/home) */
#myLinks {
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

p:hover {
    background-color: #7C2D3E;
    transition: background-color .5s;
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
    border-bottom: solid white 1px;
}

/* Style the active link (or home/logo) */
.active {
    background-color: #5C9CC4;
    color: white;
} 

i {
  color: #AACCE1;
  margin-left: 5px;
}


</style>