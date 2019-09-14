import Vue from 'vue'
import { shallowMount } from '@vue/test-utils'

import Room from '@/components/Room'

describe('Room Component', () => {
  it('should render correct the Room', () => {
    const roomComponent = shallowMount(Room)
    expect(roomComponent.findAll('.roomContainer').length).toBe(1)
  })
})
