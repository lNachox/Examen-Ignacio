import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import FlightList from '../views/FlightList.vue'
import ReservationList from '../views/ReservationList.vue'
import Profile from '../views/Profile.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/flights',
    name: 'Flights',
    component: FlightList
  },
  {
    path: '/reservations',
    name: 'Reservations',
    component: ReservationList
  },
  {
    path: '/profile',
    name: 'Profile',
    component: Profile
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router