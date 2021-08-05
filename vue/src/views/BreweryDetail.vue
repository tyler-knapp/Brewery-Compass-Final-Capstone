<template>
  <div id="breweryDetail">
    <brewery-info />
    <beer-card v-for="beer in beers" v-bind:key="beer.id" v-bind:beer = "beer"/>
  </div>
</template>

<script>
import BreweryInfo from "@/components/BreweryInfo";
import BeerCard from '@/components/BeerCard.vue';
import beerService from '@/services/BeerService'

export default {
  components: {
    BreweryInfo,
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
</style>