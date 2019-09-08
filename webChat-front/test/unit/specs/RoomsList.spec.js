import { shallowMount, createLocalVue } from '@vue/test-utils'
import Vuex from 'vuex'

import Roomslist from '@/components/Roomslist'

const localVue = createLocalVue()

localVue.use(Vuex)

describe('RoomsList Component', () => {
  let store
  beforeEach(() => {
    store = new Vuex.Store({
      state: {},
      getters: {
        currentUser: jest.fn()
      }
    })
  })
  it('should render correct the List of rooms', () => {
    const component = shallowMount(Roomslist, {store, localVue})
    expect(component.findAll('.roomsList').length).toBe(1)
  })
})
