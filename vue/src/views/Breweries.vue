<template>
  <div>
<<<<<<< HEAD
      <h1 class ="headerText">Breweries</h1>
      <brewery-list />
=======
    <div class="header">
      <h1>
        Brew Hopper
      </h1>
      <router-link class="router" v-bind:to="{ name: 'home' }">Home</router-link>

    </div>
      <brewery-list  class="brewery-list"/>
>>>>>>> 2ec9a3ee8157af8778c8a782e9393822a80bb0a1
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
<<<<<<< HEAD
@import url('https://fonts.googleapis.com/css2?family=Anton&display=swap');
  .headerText{
    font-size: 80px;
    text-align: center;
    font-family: 'Anton', sans-serif;
    color: crimson;
    
  }
=======
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@800&display=swap');

.header {
  top: 0;
  text-align: center;
  background-color: rgb(113, 224, 191);
  color: white;
  font-size: 40px;
  position: fixed;
  width: 100%;
  font-family: 'Raleway', sans-serif;
}

.header .router:hover {
  background: #ddd;
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
>>>>>>> 2ec9a3ee8157af8778c8a782e9393822a80bb0a1


</style>