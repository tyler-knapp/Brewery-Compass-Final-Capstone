<template>
  <div id="app">
    <div id="nav">
      <header class="siteHeader">
        <h1 id="title">Brewery Compass</h1>
        <div class="routerLinks">
        <router-link id="Home" v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link id="Brewery" v-bind:to="{ name: 'breweries' }">Brewery</router-link>  
        <router-link id="Add-Brewery" v-bind:to="{ name: 'AddBrewery' }">Add Brewery</router-link>
        <router-link id="Add-Beer" v-bind:to="{ name: 'AddBeer' }">Add Beer</router-link>
        <router-link id="Logout" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
       </div>
        <firebase-upload></firebase-upload>
      </header>
    </div>
    <router-view />
  </div>
</template>

<style>

/* @import url('https://fonts.googleapis.com/css2?family=Quattrocento:wght@700&display=swap'); */
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@700&family=Quattrocento:wght@700&display=swap');



#Home:hover {
  color: rgb(224, 222, 222);
  text-decoration: underline ;
}

#Brewery:hover {
  color: rgb(224, 222, 222);
  text-decoration: underline ;
}

#Add-Brewery:hover {
  color: rgb(224, 222, 222);
  text-decoration: underline ;
}

#Add-Beer:hover {
  color: rgb(224, 222, 222);
  text-decoration: underline ;
}

#Logout:hover {
  color: rgb(224, 222, 222);
  text-decoration: underline ;
}

#Home {
  color: rgba(16, 16, 77, 0.938);
   text-decoration: none;
   font-size: 32px;
   padding-top: 0px;
   font-weight: bold;
   font-family: 'Josefin Sans', sans-serif;
   padding-right: 5%;
}

#Brewery {
  color: rgba(16, 16, 77, 0.938);
   text-decoration: none;
   font-size: 32px;
   font-weight: bold;
   font-family: 'Josefin Sans', sans-serif;
   padding-right: 5%;
}

#Add-Brewery {
  color: rgba(16, 16, 77, 0.938);
   text-decoration: none;
   font-size: 32px;
   font-weight: bold;
   font-family: 'Josefin Sans', sans-serif;
   padding-right: 5%;
}

#Add-Beer {
  color: rgba(16, 16, 77, 0.938);
   text-decoration: none;
   font-size: 32px;
   font-weight: bold;
   padding-right: 5%;
   font-family: 'Josefin Sans', sans-serif;
}

#title {
   color: #6e9bbb;
   text-shadow: 3px 3px rgba(16, 16, 77, 0.938);
   text-decoration: none;
   font-size: 45px;
   margin-top: 0.5%;
   font-weight: bold;
   font-family: 'Josefin Sans', sans-serif;
   text-align: center;
}

 #Logout {
  color: rgba(16, 16, 77, 0.938);
   text-decoration: none;
   font-size: 32px;
   font-weight: bold;
   font-family: 'Josefin Sans', sans-serif;
   padding-right: 5%;
} 


.siteHeader {
  position: fixed;
  top: 0;
  width: 99%;
  height: 22%;
  background-color: rgb(247, 145, 86);
  color: rgba(16, 16, 77, 0.938);
  text-align: center;
  font-size: 16px;
  border-radius: 0px 0px 10px 10px;
}

.routerLinks {
  margin-top: 2%
}

</style>

