<template>
  <div id="breweryDetail">
    <p>{{ brewery.location }}</p>
    <p>{{ brewery.description }}</p>
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