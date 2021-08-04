<template>
  <div id="app">
    <div id="nav">
      <header class="siteHeader">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
        <router-link v-bind:to="{ name: 'breweries' }">Brewery</router-link>&nbsp;|&nbsp;  
        <router-link v-bind:to="{ name: 'AddBrewery' }">Add Brewery</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </header>
    </div>
    <router-view />
  </div>
</template>

