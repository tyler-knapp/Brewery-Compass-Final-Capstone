<template>
  <div>
    <brewery-card
      v-for="brewery in breweries"
      v-bind:key="brewery.id"
      v-bind:brewery="brewery" />
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
          breweries: this.$store.state.breweries
      }
  },
  methods: {
    getAllBreweries() {
      breweryService
        .findAll()
        .then((response) => {
          this.$store.commit("SET_BREWERIES", response.data);
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
  },
  created() {
    this.getAllBreweries();
  },
};
</script>

<style>
</style>