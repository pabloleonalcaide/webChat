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
    const roomComponent = shallowMount(Room, {store, localVue})
    roomComponent.setData({
      roomId: 'r1qwerty'
    })
    expect(roomComponent.findAll('.roomContainer').length).toBe(1)
  })
})
