<template>
  <div id="breweryDetail">
    <brewery-info />
    <add-brewery />
  </div>
</template>

<script>
import BreweryInfo from "@/components/BreweryInfo";
import AddBrewery from "@/components/AddBrewery";

export default {
  components: {
    BreweryInfo,
    AddBrewery,
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