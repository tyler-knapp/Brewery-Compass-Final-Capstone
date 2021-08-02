<template>
    <div>
    <form @submit.prevent="addBrewery">
      <div>
        <label for="name">Name:</label>
        <input type="text" id="name" v-model="brewery.name" required />
      </div>
      <div>
        <label for="description">Description:</label>
        <input type="text" id="descrition" v-model="brewery.description" required />
      </div>
      <div>
        <label for="location">Location:</label>
        <input type="text" id="location" v-model="brewery.location" required />
      </div>
      <div>
        <label for="image">Image:</label>
        <input type="image" id="image" v-model="brewery.imageUrl"/>
      </div>
      <div>
        <label for="url">URL:</label>
        <input type="url" id="url" v-model="brewery.imageUrl" />
      </div>
      <input type="submit">
    </form>
  </div>
</template>

<script>
import breweryService from '@/services/BreweryService'
export default {
    name: "add-brewery",
    data(){
        return {
            brewery: {},
        };
    },
      methods: {
      addBrewery() {
          breweryService.createBrewery(this.brewery).then(response => {
              if (response.status === 200) {
                  alert("Brewery successful added");
              }
          })
      }
  }

};
</script>

<style>

</style>