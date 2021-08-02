<template>
  <div id="breweryDetail">
      <p>{{ brewery.location }}</p>
      <p>{{ brewery.description }}</p>
      <brewery-info />
      
      
      
  </div>
</template>

<script>
import BreweryInfo from '@/components/BreweryInfo'


export default {
  components: {
    
       BreweryInfo
        },
    name: 'breweries-detail',
    data() {
        return{
            brewery: {}
        }
    },
    
}
</script>

<style>

</style>