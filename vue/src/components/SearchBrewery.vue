<template>
  <div>
    <h1>{{ info }}</h1>
    <input type="text" id="searchBar" />
    <button class ="submit">submit</button>
  </div>
</template>

<script>
import BreweryService from "@/services/BreweryService.js";
export default {
  data() {
    return {
      info: null,
      name: "",
    };
  },
  

  methods: {
    returnBreweries() {
      BreweryService.searchBrewery().then(
        (repsonse) => (this.info = repsonse.data[1].city
        )
      );
     
    },
  },
  mounted() {
    this.returnBreweries();
  },
};
</script>

<style>
</style>