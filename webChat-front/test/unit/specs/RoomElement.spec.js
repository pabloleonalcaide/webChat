import Vue from 'vue'
import { shallowMount } from '@vue/test-utils'

import RoomElement from '@/components/RoomElement'

describe('RoomElement Component', () => {
  it('should render correct the RoomElement', () => {
    const element = shallowMount(RoomElement)
    expect(element.findAll('.listElement').length).toBe(1)
  })

    it('should emit the selectRoom event when button is clicked', () => {
    const element = shallowMount(RoomElement)
    const button = element.find('button')
    button.trigger('click')
    Vue.nextTick().then(() => {
      expect(button.emitted().selectRoom).toBeTruthy()
    })
  })
})