export const SET_USER = 'SET_USER'
export const SET_ROOM = 'SET_ROOM'
export const SET_ROOMS = 'SET_ROOMS'
export const ADD_ROOM = 'ADD_ROOM'

const actions = {
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

export {actions}
