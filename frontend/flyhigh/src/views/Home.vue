<template>
    <div class="home">
      <h2 class="text-3xl font-bold mb-4">Welcome to FlyHigh Airline</h2>
      <p class="mb-4">Book your next adventure with us!</p>
      <router-link to="/flights" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
        Search Flights
      </router-link>
    </div>
  </template>
  
  <script>
  export default {
    name: 'Home'
  }
  </script>