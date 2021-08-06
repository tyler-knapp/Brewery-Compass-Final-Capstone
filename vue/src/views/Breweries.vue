<template>
  <div>
    <div class="header">
      <h1>
        Brew Hopper
      </h1>
      <div class = "router">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;  
      <router-link v-bind:to="{ name: 'AddBrewery' }">Add Brewery</router-link>
      </div>

    </div>
      <brewery-list  class="brewery-list"/>
    <!-- <beer-card class="beer-card" /> -->
    <search-brewery/>

  </div>
</template>

<script>
import BreweryList from '@/components/BreweryList'
import SearchBrewery from '../components/SearchBrewery.vue'
//import BeerCard from '../components/BeerCard'

export default {
  data(){
    return{

    }
  },
    name: 'breweries',
    components: {
       BreweryList,
        SearchBrewery
       // BeerCard 
       },
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@800&display=swap');

.header {
  top: 0;
  text-align: center;
  background-color: rgb(113, 224, 191);
  color: white;
  font-size: 28px;
  position: fixed;
  height: auto;
  width: 100%;
  font-family: 'Raleway', sans-serif;
}

.header .router:hover {
  background: rgb(91, 180, 74);
  color: black;
}

.brew-title{
  text-align: center;
  margin-top: 220px;
}

.brewery-list{
  padding-top: 300px;
}

.router{
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;

}

</style>