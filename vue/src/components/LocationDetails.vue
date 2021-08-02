<template>
  <div class="details">
      <h3 id="location_name">Location Name</h3>
      <ul id="to_and_from">
          <li id="open_to">Open To:</li>
          <li id="open_from">Open From:</li>
      </ul>
      <p id="category">Category</p>
      <p id="address">Address</p>
      <p id="description">Description</p>
      <ul id="social_media">
          <li id="facebook">Facebook</li>
          <li id="url">Website</li>
          <li id="twitter">Twitter</li>
      </ul>
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
    flex-basis: 25%;
}

#open_from{
    flex-basis: 75%;
}

</style>