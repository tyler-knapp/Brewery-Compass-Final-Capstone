<template>
  <div id="beerCard" v-on:click="goToBeerPage"
  v-bind:style="{ 'background-color': backgroundColorScheme() }">
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
    },
    shuffle(array) {
      for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
      }
    },

    backgroundColorScheme() {
      var colorArray = [
        "rgba(167, 136, 155, 0.795)",
        "#72a0c1",
        "rgb(202, 148, 116)",
        "#f0dcd6",
      ];
      this.shuffle(colorArray);
      return colorArray;
    },
    }

}
</script>

<style>
#beerCard{
   display: flex;
  flex-direction: column;
  margin: 85px;
  padding: 10px;
  /*border-radius: 10px;*/
  border: 4px rgba(16, 16, 77, 0.938) solid;
  border-radius: 5px 5px;
  cursor: pointer;
  height: 435px;
}
.beerimage{
  max-width: 50%;
  height: 300px;
  border-radius: 10px;
  margin-left: auto;
  margin-right: auto;
  border: 3px rgba(16, 16, 77, 0.938) solid;
}

 


</style>