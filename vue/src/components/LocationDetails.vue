<template>
  <div class="details">
      <div
        class="testing"
        v-for="location in this.$store.state.locations"
        v-bind:key="location.id"
      >
      <h3 id="location_name">{{location.locationName}}</h3>
      <ul id="to_and_from">
        <li id="open_from">Open From: {{location.openFrom}}</li> 
        <li id="open_to">Open To: {{location.openTo}}</li>
      </ul>
      <p id="category">Category: TBD?</p>
      <p id="address">Address: {{location.address}}</p>
      <p id="description">Description: {{location.description}}</p>
      <ul id="social_media">
          <li id="facebook">Facebook: {{location.facebook}}</li>
          <li id="url">Website: {{location.Website}}</li>
          <li id="twitter">Twitter: {{location.twitter}}</li>
      </ul>
      </div>
  </div>
</template>

<script>
export default {

}
</script>

<style>
/* STYLE HERE IS VERY TEMPORARY. USED TO UNDERSTAND FLEX WITHIN COMPONENTS. */

/* div.details {
    background: grey;
} */

div.details {
    width: 33%;
    height: 94.75vh;
    overflow-y: auto;
    position: relative;
} 
div.testing{
    border-top: solid 1px;
    border-bottom: solid 1px;
}
ul#to_and_from {
    display: flex;
    list-style: none;
    justify-content: flex-start;
    padding-left:0px;
}
#open_to {
    display: flex;  
}
#open_from{
    display: flex;
    padding-right: 15px; 
}

</style>