import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Flights from '../views/Flights.vue'
import Reservations from '../views/Reservations.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/flights',
    name: 'Flights',
    component: Flights
  },
  {
    path: '/reservations',
    name: 'Reservations',
    component: Reservations
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router