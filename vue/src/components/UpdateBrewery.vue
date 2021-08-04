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
    <div >
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
      <button type="submit" v-on:click="updateBrewery()">Save Document</button>
    </div>
  </form>
</template>

<script>
import breweryService from "../services/BreweryService";

export default {
  name: "update-brewery",
  props: ["breweryID"],
  data() {
    return {
    address: "",
    name: "",
    state: "",
    city: "",
    zipCode: "",
    phoneNumber: "",
    websiteUrl: "",
    imageUrl: "",
    description: "",
    };
  },
  methods: {
    updateBrewery() {
      const brewery = { 
          id: this.breweryID,
          name: this.name,
          state: this.state,
          city: this.city,
          zipCode: this.zipCode,
          phoneNumber: this.phoneNumber,
          websiteUrl: this.websiteUrl,
          imageUrl: this.imageUrl,
          description: this.description
        };

      breweryService
        .updateBrewery(brewery)
        .then((response) => {
          if (response.status === 200) {
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
    }
  },
  created() {
    breweryService
      .getBrewery(this.breweryID)
      .then((response) => {
        this.$store.commit("SET_ACTIVE_BREWERY", response.data);
        this.name = response.data.name;
        this.city = response.data.city;
        this.state = response.data.state;
        this.address = response.data.address;
        this.zipCode = response.data.zipCode
        this.websiteUrl = response.data.websiteUrl;
        this.imageUrl = response.data.imageUrl;
        this.phoneNumber = response.data.phoneNumber;
        this.description = response.data.description;
      })
      .catch((error) => {
        if (error.response.status == 404) {
          this.$router.push("/not-found");
        }
      });
  },
};
</script>

<style>
</style>
