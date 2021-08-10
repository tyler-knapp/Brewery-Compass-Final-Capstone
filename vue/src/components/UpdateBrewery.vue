<template>
  <form v-on:submit.prevent="updateBrewery">
    <div>
      <label for="name">Name</label>
      <input type="text" v-model="name" />
    </div>
    <div>
      <label for="city">City</label>
      <input type="text" v-model="city" />
    </div>
    <div>
      <label for="state">State</label>
      <input type="text" v-model="state" />
    </div>
    <div>
      <label for="address">Address</label>
      <input type="text" v-model="address" />
    </div>
    <div>
      <label for="zipCode">Zip Code</label>
      <input type="text" v-model="zipCode" />
    </div>
    <div>
      <label for="phoneNumber">Phone Number</label>
      <input type="text" v-model="phoneNumber" />
    </div>
    <div>
      <label for="description">Description</label>
      <input type="text" v-model="description" />
    </div>
    <div>
      <label for="websiteUrl">Website Url</label>
      <input type="text" v-model="websiteUrl" />
    </div>
    <div>
      <label for="imageUrl">Image Url</label>
      <input type="text" v-model="imageUrl" />
    </div>
    <div class="actions">
      <button type="submit">Save Document</button>
    </div>
  </form>
</template>

<script>
import breweryService from "../services/BreweryService";

export default {
  name: "update-brewery",
  props: ['breweryID'],
  data() {
    return {
      name: "",
      state: "",
      address: "",
      city: "",
      zipCode: "",
      phoneNumber: "",
      websiteUrl: "",
      imageUrl: "",
      description: ""
    };
  },
  methods: {
    updateBrewery() {
      const newBrewery = {
        breweryId: this.$route.params.breweryID,
        name: this.name,
        state: this.state,
        address: this.address,
        city: this.city,
        zipCode: this.zipCode,
        phoneNumber: this.phoneNumber,
        websiteUrl: this.websiteUrl,
        imageUrl: this.imageUrl,
        description: this.description,
      };
      console.log(newBrewery)
      //newBrewery = this.$route.params.breweryID;
      breweryService
        .updateBrewery(newBrewery)
        .then((response) => {
          if (response.status === 200) {
            alert("Brewery successfully updated");
            this.$router.push("/breweries");
          }
        })
        .catch((error) => {
          this.handleErrorResponse(error, "adding");
        });
    },
    handleErrorResponse(error, verb) {
      if (error.response) {
        this.errorMsg =
          "Error " +
          verb +
          " card. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg = "Error " + verb + " card. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " card. Request could not be created.";
      }
    },
  },
  // created() {
  //   if (this.breweryID != 0) {
  //     breweryService
  //       .getBrewery(this.breweryID)
  //       .then((response) => {
  //         this.brewery = response.data;
  //       })
  //       .catch((error) => {
  //         if (error.response.status === 404) {
  //           alert("Brewery Not available.This brewery may have been deleted!");
  //           this.$router.push("/not-found");
  //         }
  //       });
    
  //   }
  // },
};
</script>

<style>
</style>
