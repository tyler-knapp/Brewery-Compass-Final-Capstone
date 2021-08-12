<template>
  <div>
    <h1 class="title">{{ brewery.name }}</h1>
    <h3 class="description">{{ brewery.description }}</h3>
    <img class="b-image" v-bind:src="brewery.imageUrl" />
    <div class="b-info">
      <h4>{{ brewery.address }}</h4>
      <h4 class="location">
        {{ brewery.city }}, {{ brewery.state }}, {{ brewery.zipCode }}
      </h4>
      <h4>{{ brewery.phoneNumber }}</h4>

      <div></div>
    </div>
    <!-- <upload/> -->
  </div>
</template>

<script>
import breweryService from "../services/BreweryService";
// import Upload from './Upload.vue';

export default {
  // components: { Upload },
  name: "breweries-detail",
  data() {
    return {
      brewery: {
        name: "",
        description: "",
        address: "",
        state: "",
        city: "",
        phoneNumber: "",
        websiteUrl: "",
        zipCode: "",
        imageUrl: "",
      },
    };
  },

  created() {
    const breweryId = this.$route.params.breweryID;
    breweryService.getBrewery(breweryId).then((response) => {
      this.brewery = response.data;
    });
  },
};
</script>
<style  scoped>
.title {
  text-align: center;
  padding-top: 150px;
  color: rgba(32, 120, 252, 0.938);
}
.description {
  text-align: center;
  font-family: "Patua One", cursive;
}
.b-image {
  display: flex;
  height: 300px;
  max-width: 50%;
  border-radius: 10px;
  margin-left: auto;
  margin-right: auto;
}
.b-info {
  border: 1px solid black;
  border-radius: 10px;
  margin-top: 30px;
  margin-left: 300px;
  font-family: "Patua One", cursive;
  margin-right: 300px;
  text-align: center;
  background: #f0dcd6;
}
</style>