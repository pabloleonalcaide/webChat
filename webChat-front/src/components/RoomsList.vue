<template>
<div>
  <RoomNavbar
    context="roomList"
    @close='closeModal'
    ></RoomNavbar>
  <h2>Bienvenido {{user}}, selecciona una sala</h2>
  <ul class="roomsList">
    <RoomElement
      v-for="(room, index) in rooms"
      :key=index
      :id="room.id"
      :name="room.name"
      @selectRoom="selectRoom"
    >
    </RoomElement>
  </ul>
</div>
</template>
<script>
import RoomNavbar from './layout/RoomNavbar'
import RoomElement from './RoomElement'
import { getRooms } from '../services/api/room'
import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)
export default {
  name: 'RoomsList',
  components: {
    'RoomNavbar': RoomNavbar,
    'RoomElement': RoomElement
  },
  beforeMount () {
    this.ensureUserExists()
    this.rooms = this.listRooms()
  },
  data () {
    return {
      user: '',
      rooms: []
    }
  },
  methods: {
    listRooms () {
      getRooms().then(resp => {
        this.rooms = resp.message
      }).catch(error => {
        console.log(error.response.data.message)
      })
    },
    ensureUserExists () {
      this.user = this.$store.getters.currentUser
      if (this.user === null || this.user === '') {
        this.$router.push('/')
      }
    },
    closeModal () {
      this.listRooms()
    },
    selectRoom (event) {
      this.$store.dispatch('setRoom', event)
      this.$router.push('/room')
    }
  }
}
</script>
<style lang="scss" scoped>
  .roomsList{
    list-style: none;
    width: 70%;
    margin: 0 auto;
  }
</style>
