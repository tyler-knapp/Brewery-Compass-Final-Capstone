<template>
  <div id="beerDetail">
    <h1>{{beer.name}}</h1>
    <p>{{beer.abv}}</p>
    <p>{{beer.ibu}}</p>
    <p>{{beer.beerDescription}}</p>
    <img v-bind:src="beer.imageUrl">
    <beer-info />
  </div>
</template>

<script>
import BeerService from "@/services/BeerService";
import BeerInfo from "@/components/BeerInfo";

export default {
  components: {
    BeerInfo
  },
  name: "beer-detail",
  data() {
    return {
      beer: {}
    };
  },
  created() {
    const beerId = this.$route.params.beerID;
    const breweryId = this.$route.params.breweryID;
    BeerService.getBeer(beerId, breweryId).then((response) => {
      this.beer = response.data;
    });
  },
};
</script>

<style>
</style>