<template>
  <div class="roomContainer">
    <RoomNavbar></RoomNavbar>
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
export default {
  name: 'room',
  data () {
    return {
      roomName: '',
      roomId: '',
      currentUser: '',
      message: '',
      message_history: [],
      users: []
    }
  },
  components: {
    'RoomNavbar': RoomNavbar
  },
  // channels: {
  //   [this.roomId]: {
  //     connected () {
  //       console.log('Connected to ' + this.roomName)
  //     },
  //     rejected () {

  //     },
  //     received (data) {
  //       console.log('Received data: ' + data)
  //     },
  //     disconnected () {
  //       console.log('Disconnected from ' + this.roomName)
  //     }
  //   }
  // },
  methods: {
    sendMessage () {
      // this.$cable.perform({
      //   channel: 'ChatChannel',
      //   action: 'send_message',
      //   data: {content: this.message}
      // })
    },
    recoverMessages () {
      // recover last 20 messages
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
</style>
