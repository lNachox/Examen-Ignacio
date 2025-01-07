import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    flights: [],
    reservations: []
  },
  mutations: {
    SET_FLIGHTS(state, flights) {
      state.flights = flights
    },
    SET_RESERVATIONS(state, reservations) {
      state.reservations = reservations
    }
  },
  actions: {
    async fetchFlights({ commit }) {
      try {
        const response = await axios.get('/api/flights')
        commit('SET_FLIGHTS', response.data)
      } catch (error) {
        console.error('Error fetching flights:', error)
      }
    },
    async fetchReservations({ commit }) {
      try {
        const response = await axios.get('/api/reservations')
        commit('SET_RESERVATIONS', response.data)
      } catch (error) {
        console.error('Error fetching reservations:', error)
      }
    }
  },
  modules: {
  }
})