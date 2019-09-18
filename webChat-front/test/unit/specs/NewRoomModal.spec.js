import Vue from 'vue'
import { shallowMount } from '@vue/test-utils'

import NewRoomModal from '@/components/NewRoomModal'

describe('NewRoomModal Component', () => {
  it('should render correct the NewRoomModal', () => {
    const modal = shallowMount(NewRoomModal)
    expect(modal.findAll('.modal').length).toBe(1)
  })

  it('should rennder error message when room name is empty', () => {
    const modal = shallowMount(NewRoomModal)
    const button = modal.find('.btn-save')
    button.trigger('click')
    Vue.nextTick().then(() => {
      expect(modal.findAll('.error-text').length).toBe(1)
    })
  })
})
