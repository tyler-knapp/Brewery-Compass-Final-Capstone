<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
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
      <label id="User" for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <br>
      <br>
      <label id="Pass" for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <br>
      <br>
      <router-link :to="{ name: 'register' }">Need an account?</router-link>
      <button type="submit">Sign in</button>
    </form>
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
<style>
/* label {
  display: flex;
  padding-top: 50px;
} */
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@700&family=Quattrocento:wght@700&display=swap');
form {
  margin-top: 150px;
  border: solid black 1px;
  margin-right: 35%;
  margin-left: 35%;
  font-family: 'Josefin Sans', sans-serif;
  padding-left: 4%;
  padding-right: 4%;
  padding-bottom: 4%;
  padding-top: 4%;
  background-color: rgb(224, 222, 222);
  border-radius: 10px;
  font-size: 25px;
  box-shadow: 5px 10px 18px #888888
}
#Pass {
  text-align: center;
}
#User {
  text-align: center;
}
</style>
