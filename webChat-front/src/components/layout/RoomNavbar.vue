<template>
  <nav>
    <img src="../../assets/chat.png" v-on:click="backToRoot">
    <button
      class="addButton"
      type="button"
      v-if="context === 'roomList'"
      v-on:click="showModal()"
      >Añadir Sala</button>
    <button
      class="addButton"
      type="button"
      v-if="context === 'room'"
      v-on:click="backToRoomList"
      >Salas</button>
    <NewRoomModal v-show="isModalVisible" @close="closeModal" />
  </nav>
</template>
<script>
import NewRoomModal from '../NewRoomModal'
import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)
export default {
  name: 'RoomNavbar',
  components: {
    NewRoomModal
  },
  props: ['context'],
  data () {
    return {
      isModalVisible: false
    }
  },
  methods: {
    showModal () {
      this.isModalVisible = true
    },
    closeModal () {
      this.$emit('close')
      this.isModalVisible = false
    },
    backToRoomList () {
      this.$router.push('/rooms')
    },
    backToRoot () {
      this.$router.push('/')
    }
  }
}
</script>
<style lang="scss" scoped>
  nav{
    display: flex;
    justify-content: space-around;
    align-items: center;
    width:100%;
    .addButton{
      padding: 10px;
      position: relative;
      display: block;
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
    img{
      height: 50px;
      cursor: pointer;
      &:hover{
        background-color: #21ADE7;
        border-radius: 100px;
      }
    }
  }
</style>
