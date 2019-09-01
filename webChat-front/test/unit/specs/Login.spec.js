import Vue from 'vue'
import { shallowMount } from '@vue/test-utils'

import Login from '@/components/Login'

describe('Login Component', () => {
  it('should render correct the Login', () => {
    const loginComponent = shallowMount(Login)
    expect(loginComponent.findAll('.loginContainer').length).toBe(1)
  })

  it('should render error message with invalid input', () => {
    const loginComponent = shallowMount(Login)
    const button = loginComponent.find('button')
    button.trigger('click')
    Vue.nextTick().then(() => {
      expect(loginComponent.findAll('.error-text').length).toBe(1)
    })
  })

  it('should detect valid input', () => {
    const loginComponent = shallowMount(Login)
    loginComponent.setData({name: 'Lovecraft'})
    const button = loginComponent.find('button')
    button.trigger('click')
    Vue.nextTick().then(() => {
      expect(loginComponent.findAll('.error-text').length).toBe(0)
    })
  })
})
