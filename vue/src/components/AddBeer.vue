<template>
  <div>
    <form class="form" @submit.prevent="addBeer"></form>
    <div>
      <label for="name"> Name</label>
      <input type="text" id="name" required />
    </div>
    <div>
      <label for="style">Style</label>
      <input type="text" id="style" required />
    </div>
    <div>
      <label for="abv"> APV </label>
      <input type="text" id="abv" />
    </div>
    <div>
      <label for="ibu">ibu</label>
      <input type="text" id="ibu" />
    </div>
    <div>
      <label for="description"></label>
      <input type="text" id="desription" />
    </div>
    <div>
      <label for="beerImage"></label>
      <input type="URL" id="image" />
    </div>
  </div>
</template>

<script>
import BeerService from "@/services/BeerService";
export default {
  name: "add-beer",
  data() {
      return{
          beer: {},
      };
  },
  methods:{
      addBeer(){
          BeerService.addBeer(this.beer,).then((response) => {
        if (response.status === 200) {
          alert("Beer successful added");
          this.$router.push('/breweries');
        }
      });
      }
  }
};
</script>

<style>
</style>