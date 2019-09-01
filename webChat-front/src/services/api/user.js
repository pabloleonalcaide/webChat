import axios from 'axios'
const HTTP = axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 100000,
  headers: {
    'Content-Type': 'application/json'
  }
})

const getUsers = () => {
  return HTTP.get('/user').then(response => {
    return response.data
  })
}
const getUser = (id) => {
  return HTTP.get('/user/' + id).then(response => {
    return response.data
  })
}
const createUser = (name) => {
  const payload = {name: name}
  return HTTP.post('/user/', payload)
}
const deleteUser = (name) => {
  return HTTP.delete('/user/', {name: name})
}

export {getUsers, getUser, createUser, deleteUser}
