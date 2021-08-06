<template>
  <div id="register" class="text-center">
    <div class="login-border">
      <form class="form-register" @submit.prevent="register">
        <div class="border">
          <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
          <div class="alert alert-danger" role="alert" v-if="registrationErrors">
            {{ registrationErrorMsg }}
          </div>
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
            
            <input
              type="password"
              id="confirmPassword"
              class="form-control"
              placeholder="Confirm Password"
              v-model="user.confirmPassword"
              required
            />
            </div>
          <router-link :to="{ name: 'login' }">Have an account?</router-link>
          <button class="btn btn-lg btn-primary btn-block" type="submit">
            Create Account
          </button>
        </div>
      </form>
    </div>  
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
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
  background-color: rgba(89, 154, 196);
}

div.field{
  display: flex;
  flex-direction: column;
  padding: 0;
  justify-content: center;
  align-items: center;
}
</style>
