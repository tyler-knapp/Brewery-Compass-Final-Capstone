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
.link{
    text-decoration: none;
    color: white;

}

</style>