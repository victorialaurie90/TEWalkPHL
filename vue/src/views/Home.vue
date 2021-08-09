<template>
  <div class="home">
    <div class = "mainImage">
          <img src="../assets/locationPictures/kelly-drive.jpg" style="margin-top: 10px; margin-bottom: 0px; padding-bottom: 0px">
          <div class="imageText"><h1><em>wlk</em>PHL</h1></div>
    </div>
    <div class="search-box">
      <form v-on:submit.prevent="freeTextSearch">
          <input type="text" required="required" id="filterText" placeholder="What do you want to do?">
          <button type="submit">Search</button>
      </form>
    </div>
    <div class="imageContainer">
      <div class="imageContainerFirstRow">
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
      </div>
      <div class="imageContainerSecondRow">
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
      </div>
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

div.mainImage{
  display: flex;
  justify-content: center;
}

div.imageContainerFirstRow {
  display: flex;
  justify-content: center;
 

}

div.imageContainerSecondRow {
  display: flex;
  justify-content: center;
}

.categoryImage {
  position: relative;
  text-align: center;
  color: white;
  padding: 5px;
}

.mainImage {
  position: relative;
  text-align: center;
  color: white;
}

.categoryImage:hover {
  cursor: pointer;
  text-shadow: 2px 2px black;
}

.imageText {
  position: absolute;
  top: 85%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 32px;
  font-weight:bolder;
  /* text-shadow: 2px 2px black; */
}

h1{
  font-size: 100px;
  display: flex;
  justify-content: center;
  margin-top:200px;
  margin-bottom: 250px;
  text-shadow: 2px 2px black;
}
p{
  font-size: 50px;
  margin-top: 0px;
  margin-bottom: 5px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
}

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
  padding-top: 20px;
  padding-bottom: 20px;
  transform: scale(1.50)
}

div.category-buttons {
  display: flex;
  justify-content: center;
  align-items: center;
  padding-top: 5px;
  padding-bottom: 10px;
}

.grow { 
  transition: all .2s ease-in-out; 
}

.grow:hover { 
  transform: scale(1.1);
}

@media(max-width: 1248px) {

  .mainImage {
    transform: scale(.8);
  }
}

@media(max-width: 1024px) {
  .home {
    transform: scale(.8);
    }

    .mainImage {
    transform: scale(.6);
  }

  div.imageContainer {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
  }

   p {
    font-style: italic;
  }

  div.category-buttons {
    flex-direction: row;
    flex-wrap: wrap;
    align-items: center;
}


  div.category-buttons>button {
    width: fit-content;
    margin: 5px;
    flex-direction: row;
}

  div.category-buttons>button>i {
    font-size: 30px;
    padding-right: 5px;
  }

}

@media(max-width: 946) {
 div.imageContainer {
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-items: center;
  }

}

@media(max-width: 768px) {

  .mainImage {
    transform: scale(.4);
  }
  .home {
    transform: scale(.8);
    }

  h1 {
    display: none;
  }

  div.search-box {
    padding-top: 30px;
  }

  p {
    font-style: italic;
    font-size: 28px;
  }

  div.category-buttons {
    flex-direction: row;
    flex-wrap: wrap;
    align-items: center;
}

  div.category-buttons>button {
    font-size: 0px;
    max-width: 100px;
    margin: 5px;
  
}

  div.category-buttons>button>i {
    font-size: 30px;
    justify-content: center;
    padding-right: 0px;
  }

}

@media(max-width: 375px) {
  .home {
    transform: scale(.8);
    }

  h1 {
    display: none;
  }

  p {
    display: none;
  }

  div.imageContainer {
    flex-direction: row;
    flex-wrap: wrap;
    align-items: center;
}

  div.imageContainer>img {
    font-size: 0px;
    max-width: 100%;
    margin: 5px;
    align-items: flex-start;
  
}

  div.category-buttons>button>i {
    font-size: 30px;
  }

}

</style>