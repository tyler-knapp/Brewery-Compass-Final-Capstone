<template>
  <div id="breweryCard" v-on:click="goToBreweryPage" >
    <h1 class="name">{{ brewery.name }}</h1>
    <!-- <img class="preview" v-bind:src="picture" > -->
    
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
 /* text-decoration: rgb(72, 77, 72) dotted underline; */
  font-family: 'Patua One', cursive;
  font-size: 48px;
  text-align: center;
  color: rgba(16, 16, 77, 0.938);
  text-shadow: 4px 2px #6e9bbb;
  animation: glowing 1300ms infinite;
}

.cardimage {
  max-width: 50%;
  height: 300px;
  border-radius: 10px;
  margin-left: auto;
  margin-right: auto;
  border: 3px rgba(16, 16, 77, 0.938) solid;
}

#breweryCard {
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

/* rgba(167, 136, 155, 0.795);
#f0dcd6 - egg shell
#72a0c1 - slate blue
rgba(16, 16, 77, 0.938); - navy blue
rgb(53, 51, 51) - charcoal grey
rgb(192, 83, 20); - burnt orange
rgb(202, 148, 116) - light orange

font color: grey

#image-main {
    border: 3px solid #f0dcd6;
    border-radius: 5px 5px;
    border-style: ridge ridge groove groove;

 h3 {
    font-size: 18px;
    font-weight: 900;
    color: rgba(16, 16, 77, 0.938); 
} 
*/
    

</style>