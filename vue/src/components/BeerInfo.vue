<template>
  <div>
    <h1 class="b-title">{{ beer.name }}</h1>
    <p>{{beer.abv}}</p>
    <p>{{beer.ibu}}</p>
    <p>{{beer.beerDescription}}</p>
    <p>{{beer.style}}</p>
    <img class="image" v-bind:src="beer.imageUrl" />
  </div>
</template>

<script>
import beerService from "../services/BeerService";

export default {
  name: "beer-detail",
  data() {
    return {
      beer: {
        name: "",
        imageUrl: "",
        abv: "",
        ibu: "",
        beerDescription: "",
        style:""
      },
    };
  },

computed: {
  display() {
    return this.$store.state.beer;
  }
},
  methods: {
    retrieveBeer() {
      beerService.getBeer(
        this.$route.params.beerID,
        this.$route.params.breweryID
      ).then((response) => {
        this.$store.commit("SET_BEER", response.data);
      });
    },
  },

//   created() {
     
//      const breweryId = this.$route.params.breweryID;
//      beerService.getAllBeersByBreweryId(breweryId).then((response) => {
//        this.beer = response.data;
//      }); 
//      this.retrieveBeer();
//   },
 };
</script>

<style>
.b-title{
  font-size: 1000px;
}
</style>