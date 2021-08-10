<template>
  <div>
    <div class="header">
      <h1 id="title">Brew Hopper</h1>
      <div class="router">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link
        >&nbsp;|&nbsp;
        <router-link v-bind:to="{ name: 'AddBrewery' }"
          >Add Brewery</router-link
        >
      </div>
    </div>
    <search-brewery class ="search"/>
    <brewery-list class="brewery-list" />
    <!-- <beer-card class="beer-card" /> -->
  </div>
</template>

<script>
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
    // BeerCard
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@800&display=swap");

.header {
  top: 0;
  background-color: rgb(113, 224, 191);
  position: fixed;
  font-size: 28px;
  height: 75px;
  width: 100%;
  font-family: "Raleway", sans-serif;
}

#title{
  color: white;
  font-size: 22px;
  position: fixed;

}

.header .router:hover {
  background: rgb(91, 180, 74);
  color: black;
}

.brew-title {
  text-align: center;
  margin-top: 220px;
}

.brewery-list {
  padding-top: 50px;
}

.router {
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.search{
  padding-top: 100px;
}
</style>