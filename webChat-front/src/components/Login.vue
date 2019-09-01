<template>
    <div class="loginContainer">
        <img src="../assets/chat.png" class="chatLogo"/>
        <div class="inputRow">
            <input type="text" v-model.trim="user" placeholder="Usuario">
            <button id="loginBtn" type="button" v-on:click="login()">Entrar</button>
        </div>
        <p v-if="invalid" class="error-text">{{ errorMessage }}</p>
    </div>
</template>
<script>
import Vue from 'vue'
import VueRouter from 'vue-router'
import { createUser } from '../services/api/user'
Vue.use(VueRouter)
export default {
  name: 'login',
  data () {
    return {
      user: '',
      invalid: false,
      response: '',
      errorMessage: ''
    }
  },
  methods: {
    login () {
      let currentUser = this.user
      this.invalid = currentUser === ''
      if (!this.invalid) {
        createUser(currentUser).then(resp => {
          this.invalid = true
          console.log(resp)
          if (resp.status === 201) {
            this.$store.dispatch('setUser', {currentUser})
            this.$router.push('Rooms')
          } else {
            this.invalid = true
            this.errorMessage = resp.data.message
          }
        })
      } else {
        this.errorMessage = 'Uno necesita un nombre'
      }
    }
  }
}

</script>
<style lang="scss" scoped>
  .chatLogo{
     width: 15%;
  }
  .error-text{
    color: #b10202;
    font-size: 0.8em;
  }
</style>
