// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import 'vue-material-design-icons/styles.css'
import UUID from 'vue-uuid'
import Vuex from 'vuex'
import App from './App'
import router from './router'
import { store } from './store/store.js'

Vue.config.productionTip = false
/** UUID generator */
Vue.use(UUID)
/** Get Vuex to the Store */
Vue.use(Vuex)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  router,
  components: { App },
  template: '<App/>'
})
