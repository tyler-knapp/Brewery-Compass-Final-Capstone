<template>
  <div id="beerCard" v-on:click="goToBeerPage">
      <h1 class="name">{{beer.name}}</h1>
      <img class="beerimage" v-bind:src="beer.imageUrl" >
  </div>
</template>

<script>
export default {
    props: ["beer"],
    methods: {
      goToBeerPage(){
      this.$router.push({
        name: "beer-detail",
        params: {
          
          beerID: this.beer.beerId
        }
      })
    }
    }

}
</script>

<style>
#beerCard{
 display: flex;
  flex-direction: column;
  margin: 20px;
  padding: 10px;
  border: 1px black solid;
  border-radius: 10px;
  cursor: pointer;
}
 


</style>