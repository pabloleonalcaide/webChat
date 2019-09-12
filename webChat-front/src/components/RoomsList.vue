<template>
<div>
  <RoomNavbar></RoomNavbar>
  <h2>Bienvenido {{user}}, selecciona una sala</h2>
  <ul class="roomsList">
    <RoomElement
      v-for="(room, index) in rooms"
      :key=index
      :id="room.id"
      :name="room.name"
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
  beforeMount () {
    this.ensureUserExists()
    this.rooms = this.listRooms()
  },
  mounted () {
    this.$store.dispatch('setRooms', this.rooms)
  },
  components: {
    'RoomNavbar': RoomNavbar,
    'RoomElement': RoomElement
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
      })
    },
    ensureUserExists () {
      this.user = this.$store.getters.currentUser
      if (this.user === null || this.user === '') {
        this.$router.push('Login')
      }
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
