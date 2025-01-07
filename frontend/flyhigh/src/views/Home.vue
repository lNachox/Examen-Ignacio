<template>
  <div class="home">
    <h1>Welcome to FlyHigh Airlines</h1>
    <p>Your journey begins with us!</p>
    <div class="user-type" v-if="userType">
      <p>Logged in as: {{ userType }}</p>
      <ul class="user-actions">
        <li v-if="userType === 'frequent'">View your loyalty points</li>
        <li v-if="userType === 'tourist'">Check out our holiday packages</li>
        <li v-if="userType === 'staff'">Access staff portal</li>
      </ul>
    </div>
    <div v-else>
      <button @click="login('frequent')">Login as Frequent Flyer</button>
      <button @click="login('tourist')">Login as Tourist</button>
      <button @click="login('staff')">Login as Airline Staff</button>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue'

export default {
  name: 'HomeView',
  setup() {
    const userType = ref(null)

    const login = (type) => {
      userType.value = type
      // Here you would typically call an authentication service
    }

    return {
      userType,
      login
    }
  }
}
</script>

<style scoped>
.home {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

h1 {
  color: #3498db;
}

.user-type {
  margin-top: 20px;
  padding: 10px;
  background-color: #ecf0f1;
  border-radius: 5px;
}

button {
  margin: 10px;
  padding: 10px 20px;
  background-color: #3498db;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #2980b9;
}
</style>