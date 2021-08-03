<template>
    <div class="navigation">
        <nav>
            <ul class = "list">
                <router-link :to= " { name: 'home' } "><li>Home</li></router-link> 
                <router-link :to= " { name: 'login'} "><li>Login</li></router-link> 
                <router-link :to= " { name: 'search-result'} "><li>Search</li></router-link>
            </ul>
        </nav>
    </div>
</template>

<script>
export default {
    name: 'navigation-bar'
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