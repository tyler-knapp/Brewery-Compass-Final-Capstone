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
        <label for="address">Address:</label>
        <input type="text" id="address" v-model="brewery.address" required />
      </div>
      <div>
        <label for="state">State:</label>
        <input type="text" id="state" v-model="brewery.state" required />
      </div>
      <div>
        <label for="city">City:</label>
        <input type="text" id="city" v-model="brewery.city" required />
      </div>
      <div>
        <label for="zip">Zip Code:</label>
        <input type="text" id="zip" v-model="brewery.zipCode" required />
      </div>
      <div>
        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" v-model="brewery.phoneNumber" required />
      </div>
      <div>
        <label for="websiteurl">Website Url:</label>
        <input type="url" id="websiteurl" v-model="brewery.websiteUrl" required />
      </div>
      <div>
        <label for="imageurl">Image Url:</label>
        <input type="url" id="imageurl" v-model="brewery.imageUrl" />
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