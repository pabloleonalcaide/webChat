import Vue from 'vue'
import VueResource from 'vue-resource'
import { uuid } from 'vue-uuid'

/** Vue Resource for Ajax Requests */
Vue.use(VueResource)
const baseURL = 'http://localhost:3000'

const createUser = (user) => {
  return Vue.http.post(baseURL + '/user/', user)
}

const formatUserMessage = (name) => {
  return JSON.parse(`{"name": "${name}", "id": "${uuid.v4()}"}`)
}
export { createUser, formatUserMessage }
