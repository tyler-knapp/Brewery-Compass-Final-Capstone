<template>
  <div>
    <brewery-card
      v-for="brewery in display"
      v-bind:key="brewery.id"
      v-bind:brewery="brewery"
      v-bind:style="{ 'background-color':randomBackgroundColor() }"
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
  computed: {
    display() {
      return this.$store.state.breweries;
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
    this.getAllBreweries();
  },
};
</script>

<style>
</style>