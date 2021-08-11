import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import firebase from 'firebase'



Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;



new Vue({
  router,
  store,
  render: h => h(App),

  created () {

    var firebaseConfig = {
      apiKey: "AIzaSyAVwshBpLM_1FDTCIkJnM_6MN5pMOUa6jQ",
      authDomain: "brewery-compass.firebaseapp.com",
      projectId: "brewery-compass",
      storageBucket: "brewery-compass.appspot.com",
      messagingSenderId: "551073903936",
      appId: "1:551073903936:web:1a249afdc91af5b1dc76a5",
      measurementId: "G-87JQCM1ME5"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    firebase.analytics();
 
  },


}).$mount('#app')


