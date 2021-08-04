<template>
  <div>
    <h1>Update Brewery</h1>
     <update-brewery v-bind:breweryID="parseInt($route.params.id)" />
  </div>
</template>

<script>
import UpdateBrewery from "@/components/UpdateBrewery"

export default {

  components: {
    UpdateBrewery
  }
};
</script>

<style>
</style>