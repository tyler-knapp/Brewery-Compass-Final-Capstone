<template>
  <div>
    <h1 class="add-title">Add a Beer to Your Brewery</h1>
    <form class="form" @submit.prevent="createBeer">
      <div>
        <label for="name"> Name</label>
        <input type="text" id="name" required v-model="beer.name" />
      </div>
      <div>
        <label for="breweryNumber"> Brewery ID:</label>
        <input type="number" id="breweryNumber" required v-model="beer.breweryId" />
      </div>
      <div>
        <label for="style">Style</label>
        <input type="text" id="style" required v-model="beer.style" />
      </div>
      <div>
        <label for="abv"> APV </label>
        <input type="text" id="abv" v-model="beer.apv"/>
      </div>
      <div>
        <label for="ibu">IBU</label>
        <input type="text" id="ibu" v-model="beer.ibu"/>
      </div>
      <div>
        <label for="description">Description</label>
        <input type="text" id="desription" v-model="beer.beerDescription"/>
      </div>
      <div>
        <label for="beerImage">Image URL:</label>
        <input type="URL" id="image" v-model="beer.imageUrl"/>
      </div>
      <input type="submit" />
    </form>
  </div>
</template>

<script>
import beerService from "@/services/BeerService";
export default {
  name: "add-beer",
  data() {
    return {
      beer: {},
    };
  },
  methods: {
    createBeer() {
      beerService.addBeer(this.beer).then((response) => {
        if (response.status === 200) {
          alert("Beer successful added");
          this.$router.push('/breweries');
        }
      });
    },
  },
};
</script>

<style>
.add-title{
  font-size: 55px;
  text-align: center;
  margin-top: 155px;
  margin-bottom: -85px;
  padding-bottom: -55;
}
</style>