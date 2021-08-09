<template>
  <div>
    <info-card v-for="info in infoDisplay" v-bind:key="info.id" v-bind:info="info"/>
    <input type="text" id="searchBar" />
  </div>
</template>

<script>
//import BreweryService from "@/services/BreweryService.js";
import axios from "axios";
import InfoCard from '@/components/InfoCard.vue'
export default {
  components:{
    InfoCard
  },
  data() {
    return {
      info: [],
    };
  },
  computed: {
    infoDisplay() {
      return this.$store.state.info;
    },
    searchBrewery() {
      return axios.get(
        "https://api.openbrewerydb.org/breweries?by_city=cleveland"
      );
    },
  },
  methods: {
    returnBreweries() {
      this.searchBrewery
        .then((response) => {
          this.$store.commit("SET_INFO", response.data);
        })
        .catch((error) => {
          if (error.response) {
            console.error(
              error.response.status + " " + error.response.statusText
            );
          } else if (error.request) {
            console.error(error.request);
          }
          // Axios Error
          else {
            console.error("Unexpected Axios error");
          }
        });
    },
  },

  // Might make sense using a spread operator (maybe a for loop?) to get all of the objects instead of objects
  // at a certain index position.
  created() {
    this.returnBreweries();
  },
};
</script>

<style>
</style>