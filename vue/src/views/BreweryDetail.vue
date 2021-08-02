<template>
  <div id="breweryDetail">
      <p>{{ brewery.location }}</p>
      <p>{{ brewery.description }}</p>
      <brewery-info />
      <brewery-card />
      
  </div>
</template>

<script>
import BreweryInfo from '@/components/BreweryInfo'
import BreweryCard from '@/components/BreweryCard.vue';
export default {
  components: {
       BreweryCard,
       BreweryInfo
        },
    name: 'breweries-detail',
    data() {
        return{
            brewery: {}
        }
    },
    created() {
        const breweryId = this.$route.params.breweryID;
        this.brewery = this.$store.state.breweries.find( brewery => {
            return brewery.breweryID === breweryId;
        });
    }
}
</script>

<style>

</style>