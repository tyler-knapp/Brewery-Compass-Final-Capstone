<template>
  <div id="newBreweryForm">
      <h1>
         New Brewery Form
     </h1>
     <add-brewery />  
     
  </div>
</template>

<script>
import AddBrewery from "@/components/AddBrewery";

export default {
components: {
    AddBrewery
  },
  name: "new-brewery-form",
}
</script>

<style>

</style>