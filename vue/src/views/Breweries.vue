<template>
  <div>
    <search-brewery class ="search"/>
     
    <brewery-list class="brewery-list" />
    <Map />
    <!-- <beer-card class="beer-card" /> -->
  </div>
</template>

<script>
import Map from'@/components/Map'
import BreweryList from "@/components/BreweryList";
import SearchBrewery from "../components/SearchBrewery.vue";
//import BeerCard from '../components/BeerCard'

export default {
  data() {
    return {};
  },
  name: "breweries",
  components: {
    BreweryList,
    SearchBrewery,
    Map
    // BeerCard
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@800&display=swap");

.header {
  top: 0;
  position: fixed;
  font-size: 28px;
  height: 75px;
  width: 100%;
  font-family: "Raleway", sans-serif;
}

.brew-title {
  text-align: center;
  margin-top: 220px;
}
/* 
.brewery-list {
  padding-top: 50px;
} */

.router {
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

</style>