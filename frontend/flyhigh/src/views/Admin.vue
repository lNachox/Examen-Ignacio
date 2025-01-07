<template>
    <div class="admin">
      <h2>Admin Panel</h2>
      <div class="admin-sections">
        <div class="section">
          <h3>Manage Users</h3>
          <button @click="showAddUserForm = true">Add New User</button>
          <div v-if="showAddUserForm" class="add-user-form">
            <input v-model="newUser.name" placeholder="Name" />
            <select v-model="newUser.type">
              <option value="frequent">Frequent Flyer</option>
              <option value="tourist">Tourist</option>
              <option value="staff">Airline Staff</option>
            </select>
            <button @click="addUser">Add User</button>
          </div>
        </div>
        <div class="section">
          <h3>Manage Flights</h3>
          <button @click="showAddFlightForm = true">Add New Flight</button>
          <div v-if="showAddFlightForm" class="add-flight-form">
            <input v-model="newFlight.number" placeholder="Flight Number" />
            <input v-model="newFlight.origin" placeholder="Origin" />
            <input v-model="newFlight.destination" placeholder="Destination" />
            <input v-model="newFlight.departureTime" type="datetime-local" />
            <input v-model="newFlight.price" type="number" placeholder="Price" />
            <button @click="addFlight">Add Flight</button>
          </div>
        </div>
        <div class="section">
          <h3>View All Reservations</h3>
          <ul>
            <li v-for="reservation in allReservations" :key="reservation.id">
              Reservation #{{ reservation.id }} - Flight {{ reservation.flightNumber }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue'
  
  export default {
    name: 'AdminView',
    setup() {
      const showAddUserForm = ref(false)
      const showAddFlightForm = ref(false)
      const newUser = ref({ name: '', type: '' })
      const newFlight = ref({ number: '', origin: '', destination: '', departureTime: '', price: null })
      const allReservations = ref([
        { id: 1, flightNumber: 'FH001' },
        { id: 2, flightNumber: 'FH003' },
        { id: 3, flightNumber: 'FH005' },
      ])
  
      const addUser = () => {
        // Here you would typically call a user creation service
        console.log('Adding user:', newUser.value)
        showAddUserForm.value = false
        newUser.value = { name: '', type: '' }
      }
  
      const addFlight = () => {
        // Here you would typically call a flight creation service
        console.log('Adding flight:', newFlight.value)
        showAddFlightForm.value = false
        newFlight.value = { number: '', origin: '', destination: '', departureTime: '', price: null }
      }
  
      return {
        showAddUserForm,
        showAddFlightForm,
        newUser,
        newFlight,
        allReservations,
        addUser,
        addFlight
      }
    }
  }
  </script>
  
  <style scoped>
  .admin {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }
  
  .admin-sections {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
  }
  
  .section {
    flex: 1;
    min-width: 200px;
    background-color: #ecf0f1;
    padding: 15px;
    border-radius: 5px;
  }
  
  button {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 3px;
    cursor: pointer;
    margin-bottom: 10px;
  }
  
  input, select {
    display: block;
    width: 100%;
    margin-bottom: 10px;
    padding: 5px;
  }
  </style>