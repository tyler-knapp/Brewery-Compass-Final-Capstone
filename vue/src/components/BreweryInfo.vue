<template>
  <div>
<<<<<<< HEAD
      <h1 class = "title" >{{brewery.name}}</h1>
      <h3 class = "description">{{brewery.description}}</h3>
       <img class = "image" v-bind:src="brewery.imageUrl"  >
        <h4>{{brewery.address}}</h4>
      <h4 class="location">{{brewery.city}}, {{ brewery.state }}, {{brewery.zipCode}}</h4>
      <h4>{{brewery.phoneNumber}}</h4>
   
=======
    <header class="headerFixed">
      <div>
        <h1>{{brewery.name}}</h1>
      </div>
    </header>
      <p>{{brewery.description}}</p>
      <p>{{brewery.address}}</p>
      <p class="location">{{brewery.city}}, {{ brewery.state }}, {{brewery.zipCode}}</p>
      <p>{{brewery.phoneNumber}}</p>
      <img v-bind:src="brewery.imageUrl" >
>>>>>>> 2ec9a3ee8157af8778c8a782e9393822a80bb0a1
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


</style>