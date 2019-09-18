import axios from 'axios'
const HTTP = axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 100000,
  headers: {
    'Content-Type': 'application/json'
  }
})

const getRooms = () => {
  return HTTP.get('/rooms').then(response => {
    return response.data
  })
}
const createRoom = (id, name) => {
  const payload = {roomId: id, roomName: name}
  return HTTP.post('/rooms/', payload)
}
const deleteRoom = (name) => {
  return HTTP.delete('/rooms/', {name: name})
}

export {getRooms, createRoom, deleteRoom}
