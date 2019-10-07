<template>
    <div class="loginContainer">
        <img src="../assets/chat.png" class="chatLogo"/>
        <div class="inputRow">
            <input
              type="text"
              v-model.trim="userName"
              placeholder="Usuario"
              @keyup.enter="login">
            <button id="loginBtn"
              type="button"
              @click="login">
            Entrar</button>
        </div>
        <p v-if="invalid" class="error-text">{{ errorMessage }}</p>
    </div>
</template>
<script>
import Vue from 'vue'
import VueRouter from 'vue-router'
import { createUser, formatUserMessage } from '../services/api/user'
import { NO_USER_NAME_ERROR } from '../../statics/constants'

Vue.use(VueRouter)
export default {
  name: 'login',
  data () {
    return {
      userName: '',
      invalid: false,
      response: '',
      errorMessage: ''
    }
  },
  methods: {
    login () {
      let userName = this.userName
      this.invalid = userName === ''
      if (!this.invalid) {
        let currentUser = formatUserMessage(userName)
        createUser(currentUser).then(resp => {
          if (resp.status === 201) {
            this.$store.dispatch('setUser', currentUser)
            this.$router.push('/rooms')
          } else {
            this.invalid = true
            this.errorMessage = resp.message
          }
        }).catch(error => {
          this.invalid = true
          this.errorMessage = error.response.data.message
        })
      } else {
        this.errorMessage = NO_USER_NAME_ERROR
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
