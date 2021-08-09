<template>
  <div id="login" class="text-center">
    <div class="login-border">
      <form class="form-signin" @submit.prevent="login">
        <div
          class="alert alert-danger"
          role="alert"
          v-if="invalidCredentials"
        >Invalid username and password!</div>
        <div
          class="alert alert-success"
          role="alert"
          v-if="this.$route.query.registration"
        >Thank you for registering, please sign in.</div>
        <div class="border">
            <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
            <div class="field">        
                <label for="username" class="sr-only">Username</label>
                <input
                  type="text"
                  id="username"
                  class="form-control"
                  placeholder="Username"
                  v-model="user.username"
                  required
                  autofocus
                />
            </div>
            <div class="field">        
                <label for="password" class="sr-only">Password</label>
                <input
                  type="password"
                  id="password"
                  class="form-control"
                  placeholder="Password"
                  v-model="user.password"
                  required
                />
            </div>

            <router-link :to="{ name: 'register' }">Need an account?</router-link>
            <button type="submit">Sign in</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>

h1{
  font-size: 56px;
  display: flex;
  justify-content: center;
  align-items: center;
  /* margin-top:250px; */
  margin-bottom: 5px;
}

p{
  display: flex;
  justify-content: center;
  align-items: center;
}

label{
}

div.login-border{
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 95vh;
}

div.border {
  border-radius: 50px;
  justify-content: center;
  align-items: center;
  display: flex;
  flex-direction: column;
  padding-bottom: 70px;
  padding-left: 20px;
  padding-right: 20px;
  background-color: rgba(89, 154, 196, .9);
  background: linear-gradient(to bottom, #5C9CC4 0%, #64749C 100%);
  -webkit-box-shadow: 0 10px 6px -6px #777;
     -moz-box-shadow: 0 10px 6px -6px #777;
          box-shadow: 0 10px 6px -6px #777;
}

div.field{
  display: flex;
  flex-direction: column;
  padding: 0;
  justify-content: center;
  align-items: center;
}
</style>