<template>
  <div class="flights">
    <h2>Available Flights</h2>
    <div class="flight-filters">
      <input v-model="originFilter" placeholder="Filter by origin" />
      <input v-model="destinationFilter" placeholder="Filter by destination" />
    </div>
    <ul class="flight-list">
      <li v-for="flight in filteredFlights" :key="flight.id" class="flight-item">
        <h3>Flight {{ flight.number }}</h3>
        <p>From: {{ flight.origin }} To: {{ flight.destination }}</p>
        <p>Departure: {{ flight.departureTime }}</p>
        <p>Price: ${{ flight.price }}</p>
        <p>Status: {{ flight.status }}</p>
        <button @click="bookFlight(flight)" :disabled="flight.status !== 'scheduled'">
          Book Now
        </button>
      </li>
    </ul>
  </div>
</template>

<script>
import { ref, computed } from 'vue'

export default {
  name: 'FlightsView',
  setup() {
    const flights = ref([
      { id: 1, number: 'FH001', origin: 'New York', destination: 'London', departureTime: '2023-07-01 10:00', price: 500, status: 'scheduled' },
      { id: 2, number: 'FH002', origin: 'London', destination: 'Paris', departureTime: '2023-07-02 14:00', price: 200, status: 'confirmed' },
      { id: 3, number: 'FH003', origin: 'Paris', destination: 'Rome', departureTime: '2023-07-03 09:00', price: 150, status: 'scheduled' },
      { id: 4, number: 'FH004', origin: 'Rome', destination: 'New York', departureTime: '2023-07-04 22:00', price: 600, status: 'scheduled' },
      { id: 5, number: 'FH005', origin: 'New York', destination: 'Tokyo', departureTime: '2023-07-05 23:00', price: 1000, status: 'scheduled' },
    ])

    const originFilter = ref('')
    const destinationFilter = ref('')

    const filteredFlights = computed(() => {
      return flights.value.filter(flight => 
        flight.origin.toLowerCase().includes(originFilter.value.toLowerCase()) &&
        flight.destination.toLowerCase().includes(destinationFilter.value.toLowerCase())
      )
    })

    const bookFlight = (flight) => {
      // Here you would typically call a booking service
      console.log(`Booking flight ${flight.number}`)
    }

    return {
      flights,
      originFilter,
      destinationFilter,
      filteredFlights,
      bookFlight
    }
  }
}
</script>

<style scoped>
.flights {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.flight-filters {
  margin-bottom: 20px;
}

.flight-filters input {
  margin-right: 10px;
  padding: 5px;
}

.flight-list {
  list-style-type: none;
  padding: 0;
}

.flight-item {
  background-color: #ecf0f1;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
}

button {
  background-color: #2ecc71;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 3px;
  cursor: pointer;
}

button:disabled {
  background-color: #95a5a6;
  cursor: not-allowed;
}
</style>