import axios from 'axios'
import { uuid } from 'vue-uuid'

const HTTP = axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 100000,
  headers: {
    'Content-Type': 'application/json'
  }
})

const getUser = (id) => {
  return HTTP.get('/user/' + id).then(response => {
    return response.data
  })
}
const createUser = (user) => {
  return HTTP.post('/user/', user)
}
const deleteUser = (name) => {
  return HTTP.delete('/user/', {name: name})
}
const formatUserMessage = (name) => {
  return JSON.parse('{"name": "' + name + '", "id": "' + uuid.v4() + '"}')
}
export { getUser, createUser, deleteUser, formatUserMessage }
