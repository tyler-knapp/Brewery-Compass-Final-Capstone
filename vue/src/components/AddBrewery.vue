<template>
    <div>
    <form class="form" @submit.prevent="addBrewery">
      <div>
        <label for="name">Name:</label>
        <input type="text" id="name" v-model="brewery.name" required />
      </div>
      <div>
        <label for="address">Address:</label>
        <input type="text" id="address" v-model="brewery.address" required />
      </div>
      <div>
        <label for="state">State</label>
        <select v-model="brewery.state" required id="state" name="state">
          <option value="---">---</option>
          <option value="Alabama">Alabama</option>
          <option value="Alaska">Alaska</option>
          <option value="Arizona">Arizona</option>
          <option value="Arkansas">Arkansas</option>
          <option value="California">California</option>
          <option value="Colorado">Colorado</option>
          <option value="Connecticut">Connecticut</option>
          <option value="Delaware">Delaware</option>
          <option value="District of Columbia">District of Columbia</option>
          <option value="Florida">Florida</option>
          <option value="Georgia">Georgia</option>
          <option value="Guam">Guam</option>
          <option value="Hawaii">Hawaii</option>
          <option value="Idaho">Idaho</option>
          <option value="Illinois">Illinois</option>
          <option value="Indiana">Indiana</option>
          <option value="Iowa">Iowa</option>
          <option value="Kansas">Kansas</option>
          <option value="Kentucky">Kentucky</option>
          <option value="Louisiana">Louisiana</option>
          <option value="Maine">Maine</option>
          <option value="Maryland">Maryland</option>
          <option value="Massachusetts">Massachusetts</option>
          <option value="Michigan">Michigan</option>
          <option value="Minnesota">Minnesota</option>
          <option value="Mississippi">Mississippi</option>
          <option value="Missouri">Missouri</option>
          <option value="Montana">Montana</option>
          <option value="Nebraska">Nebraska</option>
          <option value="Nevada">Nevada</option>
          <option value="New Hampshire">New Hampshire</option>
          <option value="New Jersey">New Jersey</option>
          <option value="New Mexico">New Mexico</option>
          <option value="New York">New York</option>
          <option value="North Carolina">North Carolina</option>
          <option value="North Dakota">North Dakota</option>
          <option value="Ohio">Ohio</option>
          <option value="Oklahoma">Oklahoma</option>
          <option value="Oregon">Oregon</option>
          <option value="Pennsylvania">Pennsylvania</option>
          <option value="Puerto Rico">Puerto Rico</option>
          <option value="Rhode Island">Rhode Island</option>
          <option value="South Carolina">South Carolina</option>
          <option value="South Dakota">South Dakota</option>
          <option value="Tennessee">Tennessee</option>
          <option value="Texas">Texas</option>
          <option value="Utah">Utah</option>
          <option value="Vermont">Vermont</option>
          <option value="Virginia">Virginia</option>
          <option value="Virgin Islands">Virgin Islands</option>
          <option value="Washington">Washington</option>
          <option value="West Virginia">West Virginia</option>
          <option value="Wisconsin">Wisconsin</option>
          <option value="Wyoming">Wyoming</option>
        </select>
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
        <input
          type="url"
          id="websiteurl"
          v-model="brewery.websiteUrl"
          required
        />
      </div>
      <div>
        <label for="imageurl">Image Url:</label>
        <input type="url" id="imageurl" v-model="brewery.imageUrl" />
      </div>
      <div>
        <label for="description">Description:</label>
        <input style="height:120px;font-size:12pt;" type="text" id="description" v-model="brewery.description"  />
      </div>
      <input type="submit" />
    </form>
  </div>
</template>

<script>
import breweryService from "@/services/BreweryService";
export default {
  name: "add-brewery",
  data() {
    return {
      brewery: {},
    };
  },
  methods: {
    addBrewery() {
      breweryService.createBrewery(this.brewery).then((response) => {
        if (response.status === 200) {
          alert("Brewery successful added");
          this.$router.push('/breweries');
        }
      });
    },
  },
};
</script>

<style>

label{
   display: table-row-group;
}
</style>