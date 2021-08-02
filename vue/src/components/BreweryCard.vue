<template>
  <div id="breweryCard">
    <h1 class="name">{{ brewery.name }}</h1>
    <h2 class="description">{{ brewery.description }}</h2>
    <h2 class="location">{{ brewery.location }}</h2>

  </div>
</template>

<script>
export default {
  props: ["brewery"],
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap");
* {
  font-family: "Rubik", sans-serif;
}

#breweryCard {
  display: flex;
  flex-direction: column;
  margin: 20px;
  padding: 10px;
  border: 1px black solid;
  border-radius: 10px;

}

</style>