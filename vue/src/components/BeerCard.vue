<template>
  <div id="beerCard" >
      <h1 class="name">{{beer.name}}</h1>
      <img class="beerimage" v-bind:src="beer.imageUrl" >
  </div>
</template>

<script>
export default {
    props: ["beer"],

}
</script>

<style>

</style>