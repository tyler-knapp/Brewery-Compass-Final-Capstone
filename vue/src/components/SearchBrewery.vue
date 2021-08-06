<template>
  <div>
      <form class="searchForm" @submit.prevent="searchBrewery"></form>
      <div>
        <label for="name">Name:</label>
        <input type="text" id="searchBar" v-model="brewery.name" />
      </div>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>