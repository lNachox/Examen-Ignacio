<template>
    <div class="reservation-list">
      <h2 class="text-3xl font-bold mb-4">Your Reservations</h2>
      <ul v-if="reservations.length" class="space-y-4">
        <li v-for="reservation in reservations" :key="reservation.id" class="bg-white shadow rounded-lg p-4">
          <h3 class="text-xl font-semibold">Reservation #{{ reservation.reservationNumber }}</h3>
          <p>Flight: {{ reservation.flight.origin }} to {{ reservation.flight.destination }}</p>
          <p>Flight Number: {{ reservation.flight.flightNumber }}</p>
          <p>Departure: {{ formatDate(reservation.flight.departureTime) }}</p>
          <p>Status: {{ reservation.flight.status }}</p>
          <button @click="cancelReservation(reservation.id)" class="mt-2 bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
            Cancel Reservation
          </button>
        </li>
      </ul>
      <p v-else>You have no reservations.</p>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from 'vue'
  import axios from 'axios'
  
  export default {
    name: 'ReservationList',
    setup() {
      const reservations = ref([])
  
      const fetchReservations = async () => {
        try {
          const response = await axios.get('/api/reservations')
          reservations.value = response.data
        } catch (error) {
          console.error('Error fetching reservations:', error)
        }
      }
  
      const cancelReservation = async (id) => {
        try {
          await axios.delete(`/api/reservations/${id}`)
          alert('Reservation cancelled successfully!')
          await fetchReservations()
        } catch (error) {
          console.error('Error cancelling reservation:', error)
        }
      }
  
      const formatDate = (dateString) => {
        return new Date(dateString).toLocaleString()
      }
  
      onMounted(fetchReservations)
  
      return {
        reservations,
        cancelReservation,
        formatDate
      }
    }
  }
  </script>