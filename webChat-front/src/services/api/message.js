import axios from 'axios'

const HTTP = axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 100000,
  headers: {
    'Content-Type': 'application/json'
  }
})
const formatMessage = (user, room, message) => {
  return JSON.parse('{"user":' + user + ', "room":' + room + ', "message":' + message + '}')
}

const getLastMessages = (room) => {
  return HTTP.get('/messages/', {
    params: {
      room: room
    }
  }).then(response => {
    return response.data
  })
}
 
export { formatMessage, getLastMessages }
