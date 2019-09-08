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
export default {
  name: 'RoomsList',
  beforeMount () {
    this.user = this.$store.getters.currentUser
    this.rooms = this.listRooms()
  },
  components: {
    'RoomNavbar': RoomNavbar,
    'RoomElement': RoomElement
  },
  data () {
    return {
      user: '',
      // GET rooms from API
      rooms: []
    }
  },
  methods: {
    listRooms () {
      console.log('listing rooms')
      getRooms().then(resp => {
        console.log(resp)
        this.rooms = resp.message
      })
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
