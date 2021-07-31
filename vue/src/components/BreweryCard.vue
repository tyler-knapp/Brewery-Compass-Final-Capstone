<template>
  <div id="breweryCard">
      <h1>{{brewery.brewery_name}}</h1>
      <h2>{{brewery.location}}</h2>
      <h2>{{brewery.brewery_location}}</h2>
      <h2>{{brewery.description}}</h2>
      <h2>{{brewery.description}}</h2>
  </div>
</template>

<script>

export default {
    props: ['brewery'],
    methods:{

    }
}
</script>

<style>
#breweryCard {
    display: flex;
    margin: 20px;
    padding: 10px;
    border: 1px black solid;
    border-radius: 10px;
}

</style>