<template>
  <div id="beerDetail">
    <h1 class="beer-name">{{beer.name}}</h1>
    <p class="beer-description">{{beer.beerDescription}}</p>
    <p class="beer-abv">{{beer.abv}}</p>
    <p class="beer-ibu">{{beer.ibu}}</p>
    
    <p class="beer-style">{{beer.style}}</p>
    <img class="beer-img" v-bind:src="beer.imageUrl">
    <beer-info />
  </div>
</template>

<script>
import BeerService from "@/services/BeerService";
import BeerInfo from "@/components/BeerInfo";

export default {
  components: {
    BeerInfo
  },
  name: "beer-detail",
  data() {
    return {
      beer: {}
    };
  },
  created() {
    const beerId = this.$route.params.beerID;
    const breweryId = this.$route.params.breweryID;
    BeerService.getBeer(beerId, breweryId).then((response) => {
      this.beer = response.data;
    });
  },
};
</script>

<style>

.beer-name{
  font-size:50px;
  margin-top: 200px;
  text-align: center;
  border: 1px solid black;
  border-radius: 10px;
  color: white;
  background-color: #ef476f;
}

.beer-abv{
   font-size:30px;
  text-align: center;
  border: 1px solid black;
  border-radius: 10px;
    color: white;
  background-color: #ffd166;
}
.beer-ibu{
   font-size:30px;
  text-align: center;
  border: 1px solid black;
  border-radius: 10px;
    color: white;
  background-color: #06d6a0;
}
.beer-description{
   font-size:30px;
  text-align: center;
  border: 1px solid black;
    color: white;
  border-radius: 10px;
  background-color: #118ab2;
}
.beer-style{
   font-size:30px;
  text-align: center;
  border: 1px solid black;
    color: white;
  border-radius: 10px;
  background-color: #073b4c;
}

.beer-img{
  display: flex;
  margin-right:auto;
  margin-left:auto;
  height:250px;
  border-radius: 10px;
  width:auto;
}

</style>