<template>
  <div>
      <h1>{{brewery.name}}</h1>
      <p>{{brewery.description}}</p>
      <div>
      <router-link
        :to="{ 
          name: 'breweries',  
          }"
      >Back to Brewery List</router-link>
    </div>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService";

export default {
  name: "breweries-detail",
  data() {
    return {
      brewery: {
        name: "",
        description: "",
        location: "",
      },
    };
  },
  created() {
    const breweryId = this.$route.params.boardID;
    breweryService.getBrewery(breweryId).then((response) => {
      this.brewery = response.data;
    });
  },
};
</script>