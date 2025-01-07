<template>
    <div class="flight-list">
      <h2 class="text-3xl font-bold mb-4">Available Flights</h2>
      <div class="mb-4">
        <input v-model="origin" placeholder="Origin" class="border p-2 mr-2">
        <input v-model="destination" placeholder="Destination" class="border p-2 mr-2">
        <button @click="searchFlights" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
          Search
        </button>
      </div>
      <ul v-if="flights.length" class="space-y-4">
        <li v-for="flight in flights" :key="flight.id" class="bg-white shadow rounded-lg p-4">
          <h3 class="text-xl font-semibold">{{ flight.origin }} to {{ flight.destination }}</h3>
          <p>Flight Number: {{ flight.flightNumber }}</p>
          <p>Departure: {{ formatDate(flight.departureTime) }}</p>
          <p>Price: ${{ flight.price }}</p>
          <p>Status: {{ flight.status }}</p>
          <button @click="bookFlight(flight)" class="mt-2 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
            Book Now
          </button>
        </li>
      </ul>
      <p v-else>No flights available. Try a different search.</p>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue'
  import axios from 'axios'
  
  export default {
    name: 'FlightList',
    setup() {
      const flights = ref([])
      const origin = ref('')
      const destination = ref('')
  
      const searchFlights = async () => {
        try {
          const response = await axios.get('/api/flights', {
            params: { origin: origin.value, destination: destination.value }
          })
          flights.value = response.data
        } catch (error) {
          console.error('Error fetching flights:', error)
        }
      }
  
      const bookFlight = async (flight) => {
        try {
          await axios.post('/api/reservations', { flightId: flight.id })
          alert('Flight booked successfully!')
        } catch (error) {
          console.error('Error booking flight:', error)
        }
      }
  
      const formatDate = (dateString) => {
        return new Date(dateString).toLocaleString()
      }
  
      return {
        flights,
        origin,
        destination,
        searchFlights,
        bookFlight,
        formatDate
      }
    }
  }
  </script>