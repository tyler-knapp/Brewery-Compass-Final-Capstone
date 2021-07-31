<template>
  <div id="breweryDetail">
      <h1>{{ brewery.name }}</h1>
      <p>{{ brewery.location }}</p>
      <p>{{ brewery.description }}</p>
  </div>
</template>

<script>
export default {
    name: 'brewery-detail',
    data() {
        return{
            brewery: {}
        }
    },
    created() {
        const breweryId = this.route.params.breweryID;
        this.brewery = this.$store.state.breweries.find( brewery => {
            return brewery.breweryId === breweryId;
        });
    }
}
</script>

<style>

</style>