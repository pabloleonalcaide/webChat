<template>
  <div class="roomContainer">
    <RoomNavbar
    context="room"
    ></RoomNavbar>
    <div id="conversationBox">
      <div class="messagesContainer">
        <p
          v-for="(message, index) in message_history"
          :key=index
          class="messageLine"
        >
          <span><b>{{message.user}}: </b> {{message.text}}</span>
        </p>
      </div>
    </div>
    <div class="downBar">
      <input
        type="text"
        name="message"
        v-model.trim="message"
        @keyup.enter="sendMessage"
        id="inputMessage">
      <button
        type="submit"
        @click="sendMessage"
        id="submit">Enviar</button>
    </div>
  </div>
</template>
<script>
import ActionCable from 'actioncable'
import RoomNavbar from './layout/RoomNavbar'
import { sendMessage, getLastMessages } from '../services/api/message'

import { redirect } from '../services/api/routes'
import { ROOM_WELCOME } from '../../static/constants'

export default {
  name: 'room',
  components: {
    'RoomNavbar': RoomNavbar
  },
  data () {
    return {
      roomName: '',
      currentUser: {},
      message: '',
      message_history: [],
      channel: {}
    }
  },
  methods: {
    ensureUserExists () {
      let user = this.$store.getters.currentUser
      if (user === null || user === {}) {
        redirect('/')
      }
    },
    sendMessage () {
      sendMessage(this.currentUser.name, this.roomName, this.message).then(resp => {
        this.message = ''
      }).catch(error => {
        console.error(error)
      })
    },
    stablishConnection () {
      this.currentUser = this.$store.getters.currentUser
      this.roomName = this.$store.getters.currentRoom
      var cable = ActionCable.createConsumer('http://localhost:3000/cable?token=' + this.currentUser.id)

      this.channel = cable.subscriptions.create(
        {
          channel: 'ChatChannel',
          room: this.roomName
        },
        {
          connected () {
            console.log('connected')
          },
          disconnected () {
            console.warn('disconnected')
          },
          received: (data) => {
            this.message_history.push(data)
            const chatContainer = this.$el.querySelector('#conversationBox')
            chatContainer.scrollTop = chatContainer.scrollHeight
          }
        }
      )
    },
    recoverMessages () {
      getLastMessages(this.roomName).then(resp => {
        console.log(resp.message)
        this.message_history = resp.message.reverse()
      }).catch(error => {
        console.error(error)
        this.message_history = [{text: ROOM_WELCOME, room: this.roomName, user: 'roomManager'}]
      })
    }
  },
  beforeMount () {
    this.ensureUserExists()
    this.stablishConnection()
  },
  mounted () {
    this.recoverMessages()
  },
  beforeDestroy () {
    this.channel.unsubscribe()
    console.warn('Unsubscribed from ActionCable')
  },
  updated () {
    const chatContainer = this.$el.querySelector('#conversationBox')
    chatContainer.scrollTop = chatContainer.scrollHeight
  }
}
</script>
<style lang="scss" scoped>
  .roomContainer{
    display: flex;
    flex-direction: column;
    align-items: center;
    #conversationBox{
      height: 70vh;
      width: 80%;
      border: 1px solid #21ade7;
      margin: 5px 0;
      overflow-y: scroll;
      .messagesContainer{
        .messageLine{
          text-align: left;
          margin-left: 5px;
        }
      }
    }
    .downBar{
      width: 80%;
      input[type="text"]{
        min-width: 60%;
      }
    }
  }
  #submit{
    padding: 5px 10px;
    position: relative;
    display: inline-block;
    border-width: 0;
    outline: none;
    border-radius: 2px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
    background-color: #21ade7;
    color: #fff;
    transition: background-color .3s;
    cursor:pointer;
    &:hover{
      background-color: #2b88afc5;
    }
  }
</style>
