<template>
  <div>
      <h1 class = "title" >{{brewery.name}}</h1>
      <h3 class = "description">{{brewery.description}}</h3>
       <img class = "image" v-bind:src="brewery.imageUrl"  >
        <h4>{{brewery.address}}</h4>
      <h4 class="location">{{brewery.city}}, {{ brewery.state }}, {{brewery.zipCode}}</h4>
      <h4>{{brewery.phoneNumber}}</h4>
   
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
<style  scoped>
  .title{
    text-align: center;

  }
  .description{
   text-align: center;
  }
  .image{
    height: 500px ;
    width: 100%;
  }
  .location{
    margin-left:  ;
  }


</style>