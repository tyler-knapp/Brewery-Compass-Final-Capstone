<template>
  <div>
    <div class ="container"
      style="display: flex; align-items: center; justify-content: space-evenly"
    >
      <div>
        <h1>Your Coordinates:</h1>
        <p>
          {{ myCoordinates.lat }} Latitude, {{ myCoordinates.lng }} Longitude
        </p>
      </div>
      <div>
        <h1>Map Coordinates:</h1>
        <p>
          {{ mapCoordinates.lat }} Latitude, {{ mapCoordinates.lng }} Longitude
        </p>
      </div>
    </div>
<div class="map-container">

    <GmapMap
      :center="myCoordinates"
      :zoom="zoom"
      style="width: 640px; height: 360px; margin: 32px auto"
      ref="mapRef"
      @dragend="handleDrag"
    >
    <GmapMarker
    :key="index"
    v-for="(m, index) in markers"
    :position="m.position"
    :clickable="true"
    :draggable="true"
    @click="center=m.position"
  />
    </GmapMap>

</div>

  </div>
</template>
<script>
export default {
  data() {
    return {
      map: null,
      myCoordinates: {
        lat: 0,
        lng: 0,
      },
      zoom: 10,
    };
  },
  created() {
    // does the user have a saved center? use it instead of the default
    if (localStorage.center) {
      this.myCoordinates = JSON.parse(localStorage.center);
    } else {
      //get user's coordinates from browserrequest
      this.$getLocation({})
        .then((coordinates) => {
          this.myCoordinates = coordinates;
        })
        .catch((error) => alert(error));
    }

    // does the user have a saved zoom? use it instead of the default
    if (localStorage.zoom) {
      this.zoom = parseInt(localStorage.zoom);
    }
  },
  mounted() {
    // add the map to a data object
    this.$refs.mapRef.$mapPromise.then((map) => (this.map = map));
  },
  methods: {
    handleDrag() {
      // get center and zoom level, store in localstorage
      let center = {
        lat: this.map.getCenter().lat(),
        lng: this.map.getCenter().lng(),
      };
      let zoom = this.map.getZoom();

      localStorage.center = JSON.stringify(center);
      localStorage.zoom = zoom;
    },
  },
  computed: {
    mapCoordinates() {
      if (!this.map) {
        return {
          lat: 0,
          lng: 0,
        };
      }

      return {
        lat: this.map.getCenter().lat().toFixed(4),
        lng: this.map.getCenter().lng().toFixed(4),
      };
    },
  },
};
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@700&family=Quattrocento:wght@700&display=swap');


h1{
     font-family: 'Josefin Sans', sans-serif;
}

p {
  font-family: 'Josefin Sans', sans-serif;
}

.container{
  border: solid black 1px;
  border-radius: 10px;
  background: #ffb703;
}


</style>