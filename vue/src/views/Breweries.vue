<template>
  <div>
      <h1 class ="headerText">Breweries</h1>
      <brewery-list />
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
@import url('https://fonts.googleapis.com/css2?family=Anton&display=swap');
  .headerText{
    font-size: 80px;
    text-align: center;
    font-family: 'Anton', sans-serif;
    color: crimson;
    
  }


</style>