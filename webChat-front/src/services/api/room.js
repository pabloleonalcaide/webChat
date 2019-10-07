import Vue from 'vue'
import VueResource from 'vue-resource'

/** Vue Resource for Ajax Requests */
Vue.use(VueResource)
const baseURL = 'http://localhost:3000'

const getRooms = () => {
  return Vue.http.get(baseURL + '/rooms').then(response => {
    return response.data
  })
}
const createRoom = (room) => {
  return Vue.http.post(baseURL + '/rooms/', room)
}

export {getRooms, createRoom}
