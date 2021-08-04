<template>
  <div>

    <div class="header">
      <h1>
        Brew Hopper
      </h1>
      <router-link class="router" v-bind:to="{ name: 'home' }">Home</router-link>

    </div>
      <brewery-list  class="brewery-list"/>

  </div>
</template>

<script>
import BreweryList from '@/components/BreweryList'
export default {
  data(){
    return{

    }
  },
    name: 'breweries',
    components: {
       BreweryList 
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