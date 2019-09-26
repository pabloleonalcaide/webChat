import axios from 'axios'

const HTTP = axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 100000,
  headers: {
    'Content-Type': 'application/json'
  }
})
const formatMessage = (user, room, message) => {
  return JSON.parse('{"user": "' + user + '", "room": "' + room + '", "message": "' + message + '"}')
}

const sendMessage = (user, room, message) => {
  const payload = formatMessage(user, room, message)
  return HTTP.post('/messages/', payload)
}

const getLastMessages = (roomId) => {
  return HTTP.get('/messages', {params: { roomId: roomId }}
  ).then(response => {
    return response.data
  })
}

export { sendMessage, getLastMessages }
