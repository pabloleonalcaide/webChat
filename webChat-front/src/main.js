// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Vuex from 'vuex'
import App from './App'
import router from './router'
import 'vue-material-design-icons/styles.css'
import { store } from './store/store.js'
import ActionCableVue from 'actioncable-vue'
import UUID from 'vue-uuid'

Vue.config.productionTip = false
/** UUID generator */
Vue.use(UUID)
/** Get Vuex to the Store */
Vue.use(Vuex)
/** Get ActionCable to Websocket connection */
Vue.use(ActionCableVue, {
  debug: true,
  debugLevel: 'error',
  connectionUrl: 'http://localhost:3000/cable',
  connectInmediately: true
})
/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  router,
  components: { App },
  template: '<App/>'
})
