<template>
  <div class="flights">
    <h2>Available Flights</h2>
    <ul v-if="flights.length">
      <li v-for="flight in flights" :key="flight.id">
        {{ flight.number }} - {{ flight.origin }} to {{ flight.destination }}
      </li>
    </ul>
    <p v-else>No flights available</p>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'Flights',
  computed: {
    ...mapState(['flights'])
  },
  methods: {
    ...mapActions(['fetchFlights'])
  },
  created() {
    this.fetchFlights()
  }
}
</script>