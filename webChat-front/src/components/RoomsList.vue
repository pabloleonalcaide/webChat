<template>
<div>
  <RoomNavbar></RoomNavbar>
  <h2>Bienvenido {{user}}, selecciona una sala</h2>
  <ul class="roomsList">
    <RoomElement
      v-for="room in rooms"
      :key="room.id"
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
export default {
  name: 'RoomsList',
  beforeMount () {
    this.user = this.$store.getters.currentUser
  },
  components: {
    'RoomNavbar': RoomNavbar,
    'RoomElement': RoomElement
  },
  data () {
    return {
      user: '',
      // GET rooms from API
      rooms: [
        {id: 1, name: 'Room 1'},
        {id: 2, name: 'Room 2'},
        {id: 3, name: 'Room 3'},
        {id: 4, name: 'Room 4'}
      ]
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
