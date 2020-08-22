import { shallowMount } from '@vue/test-utils'

import RoomNavBar from '@/components/layout/RoomNavBar'
describe('NavBar Component', () => {
  it('should render NavBar ', () => {
    const navBar = shallowMount(RoomNavBar)
    expect(navBar.findAll('nav').length).toBe(1)
  })
})
