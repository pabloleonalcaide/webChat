<template>
  <div class="roomContainer">
    <RoomNavbar
    context="room"
    ></RoomNavbar>
    <div class="conversationBox">
      <div class="messagesContainer">
        <p
          v-for="(message, index) in message_history"
          :key=index
          class="messageLine"
        >
          <span><b>{{message.user}}: </b> {{message.message}}</span>
        </p>
      </div>
    </div>
    <div class="downBar">
      <input type="text" name="message" v-model.trim="message" id="inputMessage">
      <button type="submit" @click="sendMessage" id="submit">Enviar</button>
    </div>
  </div>
</template>
<script>
import RoomNavbar from './layout/RoomNavbar'
import { sendMessage, getLastMessages } from '../services/api/message'
import ActionCable from 'actioncable'

export default {
  name: 'room',
  components: {
    'RoomNavbar': RoomNavbar
  },
  data () {
    return {
      roomName: '',
      roomId: '',
      currentUser: {},
      message: '',
      message_history: []
    }
  },
  methods: {
    sendMessage () {
      const room = this.roomId
      sendMessage(this.currentUser.name, room, this.message).then(resp => {
        this.message = ''
      }).catch(error => {
        console.log(error)
      })
    },
    recoverMessages () {
      getLastMessages(this.roomId).then(resp => {
        this.message_history = resp.message
      }).catch(error => {
        console.log(error.response.data.message)
        this.message_history = [{message: 'Bienvenido! esta sala aún está vacía!', room: this.roomId, user: 'roomManager'}]
      })
    }
  },
  beforeMount () {
    this.currentUser = this.$store.getters.currentUser
    this.roomId = this.$store.getters.currentRoom
    var user = this.$store.getters.currentUser
    var cable = ActionCable.createConsumer('http://localhost:3000/cable?token=' + user.id)

    var channel = cable.subscriptions.create(
      'ChatChannel', {
        connected () {
          console.log('connected')
        },
        disconnected () {
          console.log('disconnected')
        },
        received: (data) => {
          console.log('received' + JSON.stringify(data))
          this.message_history.push(data)
        }
      }
    )
  },
  mounted () {
    this.recoverMessages()
  }
}
</script>
<style lang="scss" scoped>
  .roomContainer{
    display: flex;
    flex-direction: column;
    align-items: center;
    .conversationBox{
      height: 70vh;
      width: 80%;
      border: 1px solid #21ade7;
      margin: 5px 0;
      .messagesContainer{
        overflow-y: scroll;
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
