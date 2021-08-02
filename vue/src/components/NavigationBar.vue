<template>
    <div class="navigation">
        <nav>
            <ul class = "list">
                <router-link :to= " { name: 'home' } "><li>Home</li></router-link> | 
                <router-link :to= " { name: 'login'} "><li>Login</li></router-link> | 
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

<style>

div.navigation {
    /* background: purple; */
}

</style>