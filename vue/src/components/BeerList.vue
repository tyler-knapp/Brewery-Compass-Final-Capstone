<template>
   <div>
    <beer-card
      v-for="beer in display"
      v-bind:key="beer.id"
      v-bind:beer="beer"
      v-bind:style="{ 'background-color':randomBackgroundColor() }"
    />
  </div>
</template>

<script>
import BeerCard from "@/components/BeerCard";
import beerService from "@/services/BeerService";
export default {
    components: {
        BeerCard,
    },
    data() {
        return {
            isLoading: true
        }
    },
    computed: {
        display() {
      return this.$store.state.beers;
    }
    },
      methods: {
          
    getAllBeers() {
    const breweryId = this.$route.params.breweryID;
      beerService
        .getAllBeersByBreweryId(breweryId)
        .then((response) => {
          this.$store.commit("SET_BEERS", response.data);
          this.isLoading = false;
        })
        .catch((error) => {
          // Status Code error: 500, 400
          if (error.response) {
            console.error(
              error.response.status + " " + error.response.statusText
            );
          }
          // Connection Error
          else if (error.request) {
            console.error(error.request);
          }
          // Axios Error
          else {
            console.error("Unexpected Axios error");
          }
        });
    },
    randomBackgroundColor() {
      return "#" + this.generateHexCode();
    },
    generateHexCode() {
      var bg = Math.floor(Math.random() * 16777215).toString(16);
      if (bg.length !== 6) bg = this.generateHexCode();
      return bg;
    },
  },
created() {
    this.getAllBeers();
  },
};
</script>

<style>

</style>