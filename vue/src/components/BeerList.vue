<template>
  <div>
    <beer-card
      v-for="beer in beerDisplay"
      v-bind:key="beer.id"
      v-bind:beer="beer"
      v-bind:style="{ 'background-color': backgroundColorScheme() }"
    />

    <brewery-list />
  </div>
</template>

<script>
import BeerService from "../services/BeerService";
import BeerCard from "../BeerCard.vue";
import BreweryList from "../BreweryList.vue";

export default {
  components: {
    BeerCard,
    BreweryList,
  },
  data() {
    return {
      name: "",
      breweryID: 0,
    };
  },

  computed: {
    beerDisplay() {
      return this.$store.state.beers;
    },
  },

  methods: {
    getAllBeers() {
      BeerService.getAllBeersByBreweryId(breweryID)
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
    shuffle(array) {
      for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
      }
    },

    backgroundColorScheme() {
      var colorArray = [
        "rgba(167, 136, 155, 0.795)",
        "#72a0c1",
        "rgb(202, 148, 116)",
        "#f0dcd6",
      ];
      this.shuffle(colorArray);
      return colorArray;
    },
  },
  created() {
    this.getAllBeers();
  },
};
</script>

