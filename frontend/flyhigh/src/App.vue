<template>
  <div class="min-h-screen bg-gray-100">
    <header class="bg-blue-600 text-white p-4">
      <h1 class="text-2xl font-bold">FlyHigh Airline</h1>
    </header>
    <nav class="bg-blue-500 p-4">
      <router-link to="/" class="text-white mr-4">Home</router-link>
      <router-link to="/flights" class="text-white mr-4">Flights</router-link>
      <router-link to="/reservations" class="text-white mr-4">Reservations</router-link>
      <router-link to="/profile" class="text-white">Profile</router-link>
    </nav>
    <main class="container mx-auto mt-8 px-4">
      <router-view></router-view>
    </main>
    <footer class="bg-blue-600 text-white p-4 mt-8">
      <p>&copy; 2025 FlyHigh Airline. All rights reserved.</p>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>