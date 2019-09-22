import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const SET_USER = 'SET_USER'
export const SET_ROOM = 'SET_ROOM'
export const SET_ROOMS = 'SET_ROOMS'
export const ADD_ROOM = 'ADD_ROOM'

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
  mutations: {
    SET_USER (state, user) {
      state.user = user
    },
    SET_ROOM (state, room) {
      state.current_room = room
    },
    SET_ROOMS (state, rooms) {
      state.rooms = rooms
    },
    ADD_ROOM (state, room) {
      state.rooms.push({room})
    }
  },
  actions: {
    setUser ({commit, state}, user) {
      let name = user.name
      if (name.length > 2 && name.length < 16) {
        commit(SET_USER, user)
      }
    },
    setRoom ({commit, state}, room) {
      commit(SET_ROOM, room)
    },
    setRooms ({commit, state}, rooms) {
      commit(SET_ROOMS, rooms)
    },
    addRoom ({commit, state}, room) {
      commit(ADD_ROOM, room)
    }
  }
})
