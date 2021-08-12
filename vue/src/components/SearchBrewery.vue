<template>
  <div>
    
    <form class="form" id="SearchLocation" @submit.prevent="returnBreweries">
      <h2>Search By City</h2>
      <input type="text" id="searchBar" v-model="info.city" />
      <input type="submit" />
    </form>

    <div>
      <info-card
        id="infocard"
        v-for="info in infoDisplay"
        v-bind:key="info.id"
        v-bind:info="info"
        v-bind:style="{ 'background-color': backgroundColorScheme() }"
      />
    </div>
  </div>
</template>

<script>
//import BreweryService from "@/services/BreweryService.js";
import axios from "axios";
import InfoCard from "@/components/InfoCard.vue";
export default {
  components: {
    InfoCard,
  },
  data() {
    return {
      info: [],
    };
  },
  computed: {
    infoDisplay() {
      return this.$store.state.info;
    },
    searchBrewery() {
      const userInput = document.getElementById("searchBar").value;
      return axios.get(
        "https://api.openbrewerydb.org/breweries?by_city=" + userInput
      );
    },
  },
  methods: {
    returnBreweries() {
      this.searchBrewery
        .then((response) => {
          this.$store.commit("SET_INFO", response.data);
        })
        .catch((error) => {
          if (error.response) {
            console.error(
              error.response.status + " " + error.response.statusText
            );
          } else if (error.request) {
            console.error(error.request);
          }
          // Axios Error
          else {
            console.error("Unexpected Axios error");
          }
        });
    },

      backgroundColorScheme() {
      var colorArray = [
        "rgba(167, 136, 155, 0.795)",
        "#72a0c1",
        "rgb(202, 148, 116)",
        "#f0dcd6",
      ];
      this.shuffle(colorArray);
      return colorArray;
    },

    // randomBackgroundColor() {
    //   return "#" + this.generateHexCode();
    // },
    // generateHexCode() {
    //   var bg = Math.floor(Math.random() * 16777215).toString(16);
    //   if (bg.length !== 6) bg = this.generateHexCode();
    //   return bg;
    // },
  },

  // Might make sense using a spread operator (maybe a for loop?) to get all of the objects instead of objects
  // at a certain index position.
  created() {
    this.returnBreweries();
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Patua+One&display=swap");

#infocard {
  border: 1px black solid;
  border-radius: 10px;
  padding-top: 20px;
  margin: 30px;
  text-align: center;
  font-family: "Patua One", cursive;
  box-shadow: 5px 10px 18px #888888;
}

#SearchLocation {
  text-align: center;
}

</style>