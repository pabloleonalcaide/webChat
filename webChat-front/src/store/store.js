import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const SELECT_USER = 'SELECT_USER'
export const SELECT_ROOM = 'SELECT_ROOM'

export const store = new Vuex.Store({
  state: {
    user: '',
    current_room: ''
  },
  getters: {
    currentUser: state => {
      return state.user
    },
    curentRoom: state => {
      return state.current_room
    }
  },
  mutations: {
    SELECT_USER (state, user) {
      console.log('in mutations')
      state.user = user
    },
    SELECT_ROOM (state, room) {
      state.current_room = room
    }
  },
  actions: {
    setUser ({commit, state}, user) {
      let name = user.name
      if (name.length > 2 && name.length < 16) {
        commit(SELECT_USER, name)
      }
    },
    setRoom ({commit, state}, room) {
      commit(SELECT_ROOM, room)
    }
  }
})
