<template>
  <div>
    <brewery-card
      v-for="brewery in display"
      v-bind:key="brewery.id"
      v-bind:brewery="brewery"
      v-bind:style="{ 'background-color': backgroundColorScheme() }"
    />
  </div>
</template>

<script>
import BreweryCard from "@/components/BreweryCard";
import breweryService from "@/services/BreweryService";

export default {
  components: {
    BreweryCard,
  },
  data() {
    return {
      isLoading: true,
    };
  },
  computed: {
    display() {
      return this.$store.state.breweries;
    },
  },
  methods: {
    getAllBreweries() {
      breweryService
        .findAll()
        .then((response) => {
          this.$store.commit("SET_BREWERIES", response.data);
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
    this.getAllBreweries();
  },
};
</script>

<style>
</style>