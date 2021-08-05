<template>
  <div id="beerDetail">
    <beer-info />
  </div>
</template>

<script>
import BeerService from "@/services/BeerService";
import BeerInfo from "@/components/BeerInfo";

export default {
  components: {
    BeerInfo,
  },
  name: "beer-detail",
  data() {
    return {
      beer: {},
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
</style>