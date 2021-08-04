<template>
  <div id="breweryDetail">
    <brewery-info />
   
  </div>
</template>

<script>
import BreweryInfo from "@/components/BreweryInfo";

export default {
  components: {
    BreweryInfo
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