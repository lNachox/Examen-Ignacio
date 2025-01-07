<template>
  <div class="reservations">
    <h2>My Reservations</h2>
    <ul v-if="reservations.length">
      <li v-for="reservation in reservations" :key="reservation.id">
        Reservation #{{ reservation.id }} - Flight {{ reservation.flightNumber }}
      </li>
    </ul>
    <p v-else>No reservations found</p>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'Reservations',
  computed: {
    ...mapState(['reservations'])
  },
  methods: {
    ...mapActions(['fetchReservations'])
  },
  created() {
    this.fetchReservations()
  }
}
</script>