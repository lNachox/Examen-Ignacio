/* eslint-disable */
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
//import './index.css'

axios.defaults.baseURL = 'http://localhost:8080' // Actualizar para que coincida con la URL del backend
axios.defaults.withCredentials = true

createApp(App).mount('#app')
app.use(router)
app.mount('#app')