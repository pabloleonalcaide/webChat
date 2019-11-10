<template>
<div>
  <RoomNavbar
    context="roomList"
    @close='closeModal'
    ></RoomNavbar>
  <h2>Bienvenido, selecciona una sala</h2>
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
import { redirect } from '../services/api/routes'
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
      let user = this.$store.getters.currentUser
      if (user === null || user === {}) {
        redirect('/')
      }
    },
    closeModal () {
      this.listRooms()
    },
    selectRoom (event) {
      this.$store.dispatch('setRoom', event)
      redirect('/room')
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
