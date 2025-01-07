<template>
    <div class="profile">
      <h2 class="text-3xl font-bold mb-4">Your Profile</h2>
      <div v-if="user" class="bg-white shadow rounded-lg p-4">
        <p><strong>Username:</strong> {{ user.username }}</p>
        <p><strong>User Type:</strong> {{ user.userType }}</p>
        <button @click="logout" class="mt-4 bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
          Logout
        </button>
      </div>
      <p v-else>Please log in to view your profile.</p>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from 'vue'
  import axios from 'axios'
  import { useRouter } from 'vue-router'
  
  export default {
    name: 'Profile',
    setup() {
      const user = ref(null)
      const router = useRouter()
  
      const fetchUserProfile = async () => {
        try {
          const response = await axios.get('/api/users/profile')
          user.value = response.data
        } catch (error) {
          console.error('Error fetching user profile:', error)
        }
      }
  
      const logout = async () => {
        try {
          await axios.post('/api/auth/logout')
          user.value = null
          router.push('/')
        } catch (error) {
          console.error('Error logging out:', error)
        }
      }
  
      onMounted(fetchUserProfile)
  
      return {
        user,
        logout
      }
    }
  }
  </script>