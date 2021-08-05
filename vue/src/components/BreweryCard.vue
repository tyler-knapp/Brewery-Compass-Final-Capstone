<template>
  <div id="breweryCard" v-on:click="goToBreweryPage" >
    <h1 class="name">{{ brewery.name }}</h1>
    <img class="cardimage" v-bind:src="brewery.imageUrl" >
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
@import url('https://fonts.googleapis.com/css2?family=Patua+One&display=swap');

.name{
  text-decoration: rgb(72, 77, 72) dotted underline;
  font-family: 'Patua One', cursive;
  font-size: 48px;
  text-align: center;
  text-shadow: 4px 2px rgb(122, 112, 112);
  animation: glowing 1300ms infinite;
}

.cardimage {
  max-width: 50%;
  height: auto;
  border-radius: 10px;
  
}

#breweryCard {
  display: flex;
  flex-direction: column;
  margin: 20px;
  padding: 10px;
  border: 1px black solid;
  border-radius: 10px;
  cursor: pointer;
}

</style>