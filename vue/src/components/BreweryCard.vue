<template>
  <div id="breweryCard" v-on:click="goToBreweryPage" >
    <h1 class="name">{{ brewery.name }}</h1>
    <h2 class="description">{{ brewery.description }}</h2>
    <h2 class="location">{{ brewery.location }}</h2>
    <img v-bind:src="brewery.imageUrl" >

  </div>
</template>

<script>
export default {
  props: ["brewery"],
  methods: {
    goToBreweryPage(){
      this.$router.push({
        name: "breweries-detail",
        params: {
          breweryID: this.brewery.breweryId
        }
      })
    }
  }
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap");
* {
  font-family: "Rubik", sans-serif;
}

#breweryCard {
  display: flex;
  flex-direction: column;
  margin: 20px;
  padding: 10px;
  border: 1px black solid;
  border-radius: 10px;

}

</style>