<template>
  <div id="breweryDetail">
    <brewery-info />
    
    <beer-card v-for="beer in beers" v-bind:key="beer.id" v-bind:beer = "beer"/>
    <h2 class="update-title">Update Brewery</h2>
 <update-brewery />
  </div>
</template>

<script>
import BreweryInfo from "@/components/BreweryInfo";
import BeerCard from '@/components/BeerCard.vue';
import beerService from '@/services/BeerService'
import UpdateBrewery from '@/components/UpdateBrewery.vue'


export default {
  components: {
    BreweryInfo,
    UpdateBrewery,
    BeerCard
  },
  name: "breweries-detail",
  data() {
    return {
      brewery: {},
      beers: []
    };
  },
  created(){
    const breweryId = this.$route.params.breweryID;
    beerService.getAllBeersByBreweryId(breweryId).then( response =>{
      this.beers = response.data;
    })
  }
};
</script>

<style>

.update-title{
  margin-bottom:-100px;
  font-size: 44px;
  text-align: center;
  font-family: 'Patua One', cursive;
}

</style>