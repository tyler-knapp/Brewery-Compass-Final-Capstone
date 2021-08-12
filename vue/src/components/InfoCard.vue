<template>
<div id="infocard">
<h1 class="infoName">{{info.name}}</h1>
<p class="infoStreet">{{info.street}}</p>
<p>{{info.city}} , {{info.state}} , {{info.postal_code}}</p>
<p>{{info.country}}</p>
<p>{{info.phone}}</p>
<a class="link" :href="info.website_url" target="_blank">{{info.website_url}}</a>
</div>
  
</template>

<script>
export default {
    props:["info"]

}
</script>

<style>
     @import url('https://fonts.googleapis.com/css2?family=Patua+One&display=swap');

.infoName {
 /* text-decoration: rgb(72, 77, 72) dotted underline; */
  font-family: 'Patua One', cursive;
  font-size: 48px;
  text-align: center;
  color: rgba(16, 16, 77, 0.938);
  text-shadow: 4px 2px #6e9bbb;
  animation: glowing 1300ms infinite;
}

.link{
    text-decoration: none;
    color: white;
}

#infocard {
    background: inherit;
}

</style>