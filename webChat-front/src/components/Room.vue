<template>
  <div class="roomContainer">
    <RoomNavbar
    context="room"
    ></RoomNavbar>
    <div class="conversationBox">
      <div class="messagesContainer">
      </div>
    </div>
    <div class="downBar">
      <input type="text" name="message" id="inputMessage">
      <button type="submit" @click="sendMessage" id="submit">Enviar</button>
    </div>
  </div>
</template>
<script>
import RoomNavbar from './layout/RoomNavbar'
import { sendMessage, getLastMessages } from '../services/api/message'
// import ActionCable from 'actioncable-vue'

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
  channels: {
    connected () {
      console.log('Connected to ' + this.roomName)
    },
    rejected () {

    },
    received (data) {
      console.log('Received data: ' + data)
    },
    disconnected () {
      console.log('Disconnected from ' + this.roomName)
    }
  },
  methods: {
    sendMessage () {
      const user = this.$store.getters.currentUser
      const room = this.$store.getters.currentRoom
      sendMessage(user.name, room, this.message).then(resp => {
        console.log(resp)
      }).catch(error => {
        console.log(error.response.data.message)
      })
      // this.$cable.perform({
      //   channel: 'ChatChannel',
      //   action: 'send_message',
      //   data: {content: payload}
      // })
    },
    recoverMessages () {
      getLastMessages().then(resp => {
        this.message_history = resp.message
      }).catch(error => {
        console.log(error.response.data.message)
      })
    }
  },
  mounted () {
    this.recoverMessages()
    // this.$cable.subscribe(
    //   {channel: 'ChatChannel', room: this.roomId}, this.roomId
    // )
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
