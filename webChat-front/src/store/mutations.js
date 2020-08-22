const mutations = {
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
}

export {mutations}
