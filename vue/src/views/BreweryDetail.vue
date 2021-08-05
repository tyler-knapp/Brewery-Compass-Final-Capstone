<template>
  <div id="breweryDetail">
    <brewery-info />
    <beer-card/>
   
  </div>
</template>

<script>
import BreweryInfo from "@/components/BreweryInfo";
import BeerCard from '../components/BeerCard.vue';

export default {
  components: {
    BreweryInfo,
    BeerCard
  },
  name: "breweries-detail",
  data() {
    return {
      brewery: {},
    };
  },
};
</script>

<style>
</style>