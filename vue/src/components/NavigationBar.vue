<template>
    <div class="navigation">
        <nav>
            <p class="testing">{{this.$store.state.user.username}}</p>
            <ul class = "list">
                <router-link :to= " { name: 'home' } "><li>Home</li></router-link>
                <router-link :to= " { name: 'profile'} "><li v-if = "isLoggedIn">Profile</li></router-link>
                <router-link :to= " { name: 'logout'} "><li v-if = "isLoggedIn">Logout</li></router-link> 
                <router-link :to= " { name: 'login'} "><li v-if = "isLoggedIn">Login</li></router-link> 
                <router-link :to= " { name: 'register'} "><li v-if = "isLoggedIn">Register</li></router-link> 
                <router-link :to= " { name: 'search-result'} "><li>Search (TEST TO BE DELETED)</li></router-link>
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
    }
}
</script>

<style scoped>

.navigation {
    background-color: black;
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

.testing {
    color: white;
}

</style>