<template>
  <div>
      <h1 class = "title">{{beer.name}}</h1>
      <img class = "image" v-bind:src="beer.imageUrl"  >
      
  </div>
</template>

<script>
import beerService from "../services/BeerService";

export default {
  name: "beer-detail",
  data() {
    return {
      beer: {
        breweryID: 0,
        name: "",
        imageUrl: "",
      },
    };
  },

  created() {
    const breweryId = this.$route.params.breweryID;
    beerService.getAllBeersByBreweryId(breweryId).then(response => {
      this.beer = response.data;
    });
    
  },

};
</script>

<style>

</style>