import { shallowMount, createLocalVue } from '@vue/test-utils'
import Vuex from 'vuex'
import ActionCableVue from 'actioncable-vue'
import Room from '@/components/Room'
const localVue = createLocalVue()
localVue.use(Vuex)
localVue.use(ActionCableVue, {
  debug: true,
  debugLevel: 'error',
  connectionUrl: 'http://localhost:3000/cable',
  connectInmediately: true
})
describe('Room Component', () => {
  let store
  beforeEach(() => {
    store = new Vuex.Store({
      state: {},
      getters: {
        currentUser: jest.fn(),
        currentRoom: jest.fn()
      }
    })
  })
  it('should render correct the Room', () => {
    const stablishConnection = jest.fn()
    const roomComponent = shallowMount(Room, {
      methods: {stablishConnection},
      store, 
      localVue}
      )
    roomComponent.setData({
      roomName: 'r1qwerty'
    })
    expect(roomComponent.findAll('.roomContainer').length).toBe(1)
  })
})
