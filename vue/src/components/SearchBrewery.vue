<template>
  <div>
<<<<<<< HEAD
    <h1>{{ info }}</h1>
    <input type="text" id="searchBar" />
    <button class ="submit">submit</button>
=======
    <div>
      <info-card id="infocard"
        v-for="info in infoDisplay"
        v-bind:key="info.id"
        v-bind:info="info"
      />
    </div>

    <form class="form" @submit.prevent="returnBreweries">
      <input type="text" id="searchBar" v-model="info.city" />
      <input type="submit" />
    </form>
>>>>>>> 011e180b92cf162dc9da7d3de89e94977f5f3379
  </div>
</template>

<script>
//import BreweryService from "@/services/BreweryService.js";
import axios from "axios";
import InfoCard from "@/components/InfoCard.vue";
export default {
  components: {
    InfoCard,
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
      const userInput = document.getElementById("searchBar").value;
      return axios.get(
        "https://api.openbrewerydb.org/breweries?by_city=" + userInput
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

#infocard{
  border: 1px black solid;
  border-radius: 10px;
}

</style>