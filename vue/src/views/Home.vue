<template>
  <div class="home">
    <div class="img-search-container">
      <div class = "mainImage">
            <img src="../assets/hero-image.jpg" style="margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px">
      </div>
      <div class="search-box">
        <form v-on:submit.prevent="freeTextSearch">
            <input type="text" required="required" id="filterText" placeholder="What do you want to do?">
            <button type="submit">Search</button>
        </form>
      </div>
    </div>

    <div class="imageContainer">
      <!-- <div class="imageContainerFirstRow"> -->
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/oysterHouse.jpg" v-on:click="applyNameToFilter('Restaurants')" style="width: 200px; margin: 0">
            <div class="imageText">Restaurants</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/oscars.jpg" v-on:click="applyNameToFilter('Bars')" style="width: 200px; margin: 0">
            <div class="imageText">Bars</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/citBank.jpg" v-on:click="applyNameToFilter('Sports')" style="width: 200px; margin: 0">
            <div class="imageText">Sports</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/artMuseum.jpg" v-on:click="applyNameToFilter('Fine Arts')" style="width: 200px; margin: 0">
            <div class="imageText">Art</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/libertyBell.jpg" v-on:click="applyNameToFilter('Historic Sites')" style="width: 200px; margin: 0">
            <div class="imageText">History</div>
          </div>
      <!-- </div> -->
      <!-- <div class="imageContainerSecondRow"> -->
        <div class = "categoryImage grow">
            <img src="../assets/locationPictures/fdr.jpg" v-on:click="applyNameToFilter('Parks')" style="width: 200px; margin: 0">
            <div class="imageText">Parks</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/indoor-golf.jpg" v-on:click="applyNameToFilter('Indoor')" style="width: 200px; margin: 0">
            <div class="imageText">Indoor</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/longwood.jpg" v-on:click="applyNameToFilter('Outdoor')" style="width: 200px; margin: 0">
            <div class="imageText">Outdoor</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/open-now.jpg" v-on:click="applyNameToFilter('Open Now')" style="width: 200px; margin: 0">
            <div class="imageText">Open</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/near-me.jpg" v-on:click="applyNameToFilter('Near Me')" style="width: 200px; margin: 0">
            <div class="imageText">Nearby</div>
          </div>
      <!-- </div> -->
      </div>
      

      <!-- <div class="category-buttons">
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Indoor')"><i class="fas fa-home fa-2x"></i>Indoor</button>
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Outdoor')"><i class="fas fa-cloud-sun fa-2x"></i>Outdoor</button>
          <button type="submit" class="grow" v-on:click="searchByIsOpen()"><i class="fas fa-clock fa-2x"></i>Open Now</button>
          <button type="submit" v-on:click="searchNearMe()"><i class="fas fa-street-view fa-2x"></i>Near Me</button>
      </div> -->
 
    <!-- Maybe have a little welcome message and info about wlkPHL -->
    <ul class="home-info">
      <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
      <li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
      <li>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</li>
      <li>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
    </ul>

  </div>
</template>

<script>
export default {
  name: "home",

  data() {
    return {
      filteredLocations: [],
    };
  },

methods: {
    applyNameToFilter(category) {
      this.resetSearchText();
      this.resetTimeNow();
      this.resetUserLocation();
      this.$store.state.filterCriteria = category;
      this.$store.state.filterLocation = [];
      this.$store.state.locations.forEach((loc) => {
        if (loc.categories.includes(category)) {
          this.$store.state.filterLocation.push(loc);
        }
      });
      this.$router.push({name: 'search-result'});
    },

    freeTextSearch() {
      this.resetFilterCriteria();
      this.resetTimeNow();
      this.resetUserLocation();
      let filter = document.getElementById('filterText');
      this.$store.state.searchText = filter.value;
      this.$store.state.locations.forEach((loc) => {
        if ((loc.categories.includes(filter.value)) || (loc.locationName.includes(filter.value)) || (loc.description.includes(filter.value))) {
          this.$store.state.filterLocation.push(loc);
        }
      });
      this.$router.push({name: 'search-result'});
    },

    searchByIsOpen() {
      this.resetSearchText();
      this.resetFilterCriteria();
      this.resetUserLocation();
      let today = new Date();
      let userCurrentTime = today.getHours() + ":" + today.getMinutes();
      this.$store.state.timeNow = userCurrentTime;
      this.$store.state.locations.forEach((loc) => {
        if ((loc.openFrom <= userCurrentTime && loc.openTo >= userCurrentTime) || (loc.openFrom == "00:00:00" && loc.openTo == "00:00:00")) {
          this.$store.state.filterLocation.push(loc);
        }
      });
      this.$router.push({name: 'search-result'})
    },

    searchNearMe() {
      this.resetSearchText();
      this.resetTimeNow();
      this.resetFilterCriteria();
      if (navigator.geolocation) {
        let self = this
        navigator.geolocation.getCurrentPosition(function(position) {
          let coordinates = [position.coords.latitude, position.coords.longitude];
           self.$store.state.userLocation.lat = coordinates[0];
           self.$store.state.userLocation.long = coordinates[1];
           self.$store.state.locations.forEach((loc) => {
             if (loc.distance <= 2) {
              this.$store.state.filterLocation.push(loc);
              }
            });
           self.$router.push({name: 'search-result'});  
        });
      }
    },

    resetTimeNow() {
      this.$store.state.timeNow = null;
    },

    resetFilterCriteria() {
      this.$store.state.filterCriteria = null;
    },

    resetSearchText() {
      this.$store.state.searchText = null;
    },

    resetUserLocation() {
      this.$store.state.userLocation.lat = 0;
      this.$store.state.userLocation.long = 0;
    }
  }
};
</script>

<style scoped>

/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #888;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555;
}

div.mainImage{
  display: flex;
  justify-content: center;
}

div.imageContainer {
  overflow-x: scroll;
  overflow-y: hidden;
  white-space: nowrap;
}

div.img-search-container {
  position: relative;
}

/* Currently not using seperate rows for category images */
/* div.imageContainerFirstRow {
  overflow-x: scroll;
  overflow-y: hidden;
  white-space: nowrap; 
  }*/
 
/* div.imageContainerSecondRow {
  overflow-x: scroll;
  overflow-y: hidden;
  white-space: nowrap;
} */

.categoryImage {
  display: inline-block;
  color: white;
  padding: 5px;
  
}

.mainImage {
  position: relative;
  text-align: center;
  color: white;
}

/* Need to fix display on text for images */

/* .categoryImage:hover {
  cursor: pointer;
  text-shadow: 2px 2px black;
} */

  /* .imageText {
  position: absolute;
  top: 85%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 32px;
  font-weight:bolder;
  text-shadow: 2px 2px black;
}  */

ul{
  display: flex;
  flex-direction: column;
  align-items: center;
  
}

li {
  font-size: 20px;
  font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
    'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji',
    'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
}

div.search-box{
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: -35px;
  margin-right: -835px;
  padding-bottom: 20px;
  transform: scale(1.50);
  z-index: 1;
}

.grow { 
  transition: all .2s ease-in-out; 
}

.grow:hover { 
  transform: scale(1.1);
}

@media(max-width: 400px) {
  
  div.image-search-container {
    display: flex;
  }
  div.mainImage {
    background-color: #AACCE1;
    height: 300px;
    }

  div.search-box {
    margin-left: auto;
    margin-right: auto;
    
    
  }
}

</style>