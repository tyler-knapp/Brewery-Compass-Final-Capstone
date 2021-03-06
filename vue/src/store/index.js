import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    breweries: [] ,
    beers: [],
    info:[],
    beer:{
      name:'',
      imageUrl:'',
      abv:'',
      ibu: '',
      style: '',
      breweryId: 0,
      beerDescription:''
    }
  },
  // activeBrewery: {
  //   id: 0,
  //   address: '',
  //   name: '',
  //   state: '',
  //   city: '',
  //   zipCode: '',
  //   phoneNumber: '',
  //   websiteUrl: '',
  //   imageUrl:'',
  //   description: '',
  // },
  mutations: {
    SET_BREWERIES(state, breweries){
      state.breweries = breweries;
    },
    SET_BEERS(state, beers){
      state.beers = beers
    },
    SET_INFO(state, info){
      state.info = info
    },
    SET_BEER(state, beer) {
      state.beer = beer
    },
    SET_ACTIVE_BREWERY(state, data) {
      state.activeBrewery = data;
    },
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    }
  }
})
