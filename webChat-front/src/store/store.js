import Vue from 'vue'
import Vuex from 'vuex'

import {mutations} from './mutations'
import {actions} from './actions'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    user: {},
    current_room: '',
    rooms: []
  },
  getters: {
    currentUser: state => {
      return state.user
    },
    currentRoom: state => {
      return state.current_room
    }
  },
  mutations: mutations,
  actions: actions
})
