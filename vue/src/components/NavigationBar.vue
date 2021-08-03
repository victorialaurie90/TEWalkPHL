<template>
    <div class="navigation">
        <nav>
            <p>{{this.$store.state.user.username}}</p>
            <ul class = "list">
                <router-link :to= " { name: 'home' } "><li>Home</li></router-link> 
                <router-link :to= " { name: 'login'} "><li v-if = "isLoggedIn">Login</li></router-link> 
                <router-link :to= " { name: 'search-result'} "><li>Search (TEST)</li></router-link>
                <router-link :to= " { name: 'profile'} "><li v-if = "isLoggedIn">Profile</li></router-link>
                <router-link :to= " { name: 'logout'} "><li v-if = "isLoggedIn" @click='this.$router.push({ name: "logout"})'>Logout</li></router-link>
            </ul>
        </nav>
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
        logout() {
            this.$store.state.user = 
            {
                
            };
        }
    }
}
</script>

<style scoped>

.navigation {
    background-color: gold;
}

ul {
    list-style: none;
    margin: 0%;
    padding: 0%;
    overflow: hidden;
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

</style>