import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Room from '@/components/Room'
import RoomsList from '@/components/RoomsList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    }, {
      path: '/rooms',
      name: 'Rooms',
      component: RoomsList
    }, {
      path: '/room',
      name: 'Room',
      component: Room
    }

  ]
})
