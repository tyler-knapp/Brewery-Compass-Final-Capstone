<template>
  <div>
      <h1>Breweries</h1>
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



</style>