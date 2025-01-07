<template>
  <div class="reservations">
    <h2>My Reservations</h2>
    <ul class="reservation-list">
      <li v-for="reservation in reservations" :key="reservation.id" class="reservation-item">
        <h3>Reservation #{{ reservation.id }}</h3>
        <p>Flight: {{ reservation.flightNumber }}</p>
        <p>From: {{ reservation.origin }} To: {{ reservation.destination }}</p>
        <p>Date: {{ reservation.date }}</p>
        <p>Status: {{ reservation.status }}</p>
        <button @click="cancelReservation(reservation.id)" v-if="reservation.status !== 'cancelled'">
          Cancel Reservation
        </button>
      </li>
    </ul>
  </div>
</template>

<script>
import { ref } from 'vue'

export default {
  name: 'ReservationsView',
  setup() {
    const reservations = ref([
      { id: 1, flightNumber: 'FH001', origin: 'New York', destination: 'London', date: '2023-07-01', status: 'confirmed' },
      { id: 2, flightNumber: 'FH003', origin: 'Paris', destination: 'Rome', date: '2023-07-03', status: 'confirmed' },
      { id: 3, flightNumber: 'FH005', origin: 'New York', destination: 'Tokyo', date: '2023-07-05', status: 'cancelled' },
    ])

    const cancelReservation = (id) => {
      // Here you would typically call a cancellation service
      const reservation = reservations.value.find(r => r.id === id)
      if (reservation) {
        reservation.status = 'cancelled'
      }
    }

    return {
      reservations,
      cancelReservation
    }
  }
}
</script>

<style scoped>
.reservations {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.reservation-list {
  list-style-type: none;
  padding: 0;
}

.reservation-item {
  background-color: #ecf0f1;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
}

button {
  background-color: #e74c3c;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 3px;
  cursor: pointer;
}
</style>