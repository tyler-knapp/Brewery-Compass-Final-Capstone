<template>
  <div>
      <h1>{{brewery.name}}</h1>
      <p>{{brewery.description}}</p>
      <p>{{brewery.address}}</p>
      <p class="location">{{brewery.city}}, {{ brewery.state }}, {{brewery.zipCode}}</p>
      <p>{{brewery.phoneNumber}}</p>
      <img v-bind:src="brewery.imageUrl" >
      <div>
      <router-link :to="{ name: 'breweries'}">Back to Brewery List</router-link>
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
        address: "",
        state: "",
        city: "",
        phoneNumber: "",
        websiteUrl: "",
        zipCode: "",
        imageUrl:""
      },
    };
  },
  
  created() {
    const breweryId = this.$route.params.breweryID;
    breweryService.getBrewery(breweryId).then(response => {
      this.brewery = response.data;
    });
  },
};
</script>