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
        <ErrorMessage v-if="invalid"
          :text="errorMessage"
        >
        </ErrorMessage>
    </div>
</template>
<script>
import ErrorMessage from './ErrorMessage'
import { createUser, formatUserMessage } from '../services/api/user'
import { redirect } from '../services/api/routes'
import { NO_USER_NAME_ERROR, HTTP_CREATED } from '../../static/constants'

export default {
  name: 'login',
  components: {
    'ErrorMessage': ErrorMessage
  },
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
      this.invalid = this.isValidUserName(userName)
      if (!this.invalid) {
        let currentUser = formatUserMessage(userName)
        createUser(currentUser).then(resp => {
          if (HTTP_CREATED === resp.status) {
            this.$store.dispatch('setUser', currentUser)
            redirect('/rooms')
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
    },
    isValidUserName (userName) {
      return userName.length <= 0
    }
  }
}

</script>
<style lang="scss" scoped>
  .chatLogo{
     width: 15%;
  }
</style>
