<template>
  <div class="details">
      <div
        class="testing"
        v-for="location in this.$store.state.locations"
        v-bind:key="location.id"
      >
      <h3 id="location_name">{{location.locationName}}</h3>
      <ul id="to_and_from">
        <li id="open_to">Open To: {{location.openTo}}</li>
        <li id="open_from">Open From: {{location.openFrom}}</li>
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

ul#to_and_from {
    display: flex;
    list-style: none;
}

#open_to {
    display: flex;
    flex-grow: 1;
}

#open_from{
    display: flex;
    flex-grow: 1;
}

</style>