import Vue from 'vue'
import VueResource from 'vue-resource'

/** Vue Resource for Ajax Requests */
Vue.use(VueResource)
const baseURL = 'http://localhost:3000'

const formatMessage = (user, room, message) => {
  return JSON.parse(`{"user": "${user}", "room": "${room}", "message": "${message}"}`)
}

const sendMessage = (user, room, message) => {
  const payload = formatMessage(user, room, message)
  return Vue.http.post(baseURL + '/messages/', payload)
}

const getLastMessages = (roomId) => {
  return Vue.http.get(baseURL + '/messages', {params: { roomId: roomId }}
  ).then(response => {
    return response.data
  })
}

export { sendMessage, getLastMessages }
