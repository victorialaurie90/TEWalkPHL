<template>
  <div class="home">
    <div class="img-search-container">
      <div class = "mainImage">
            <img src="../assets/locationPictures/kelly-drive.jpg" style="margin-top: 0px; margin-bottom: 0px; padding-bottom: 0px">
      </div>
      <div class="search-box">
        <form v-on:submit.prevent="freeTextSearch">
            <input type="text" required="required" id="filterText" placeholder="What do you want to do?">
            <button type="submit">Search</button>
            <button v-on:click="applyNameToFilter('')">All Locations</button>
        </form>
      </div>
    </div>

    <div class="imageContainer">
      <!-- <div class="imageContainerFirstRow"> -->
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/oysterHouse.jpg" v-on:click="applyNameToFilter('Restaurants')">
            <div class="imageText">Dining</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/oscars.jpg" v-on:click="applyNameToFilter('Bars')">
            <div class="imageText">Bars</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/citBank.jpg" v-on:click="applyNameToFilter('Sports')">
            <div class="imageText">Sports</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/artMuseum.jpg" v-on:click="applyNameToFilter('Fine Arts')">
            <div class="imageText">Art</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/libertyBell.jpg" v-on:click="applyNameToFilter('Historic Sites')">
            <div class="imageText">History</div>
          </div>
      <!-- </div> -->
      <!-- <div class="imageContainerSecondRow"> -->
        <div class = "categoryImage grow">
            <img src="../assets/locationPictures/fdr.jpg" v-on:click="applyNameToFilter('Parks')">
            <div class="imageText">Parks</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/indoor-golf.jpg" v-on:click="applyNameToFilter('Indoor')">
            <div class="imageText">Indoor</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/longwood.jpg" v-on:click="applyNameToFilter('Outdoor')">
            <div class="imageText">Outdoor</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/open-now.jpg" v-on:click="searchByIsOpen()">
            <div class="imageText">Open</div>
          </div>
          <div class = "categoryImage grow">
            <img src="../assets/locationPictures/near-me.jpg" v-on:click="searchNearMe()">
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
    <div class="home-info">
      <h2>WELCOME TO WALKPHL!</h2>
      <p><a href ="/register">Register</a> or <a href ="/login">Login</a> to check in to locations!</p>
      <p>Check in at enough locations and earn badges to be eligible for special deals and events with our ever-growing list of partners! Think you can visit them all?</p>
    </div>
    <ul class="social-icons">
        <li><a href="#"><i class="fab fa-facebook-square fa-2x"></i></a></li>
        <li><a href="#"><i class="fab fa-instagram-square fa-2x"></i></a></li>
        <li><a href="#"><i class="fab fa-twitter fa-2x"></i></a></li>
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
    calculateDistance() {
      const rawList = this.$store.state.locations;
      const userLoc = this.$store.state.userLocation;
      
      rawList.forEach(loc => {  
        var radlat1 = Math.PI * userLoc.lat / 180;
        var radlat2 = Math.PI * loc.latitude / 180;
        var theta = userLoc.long - loc.longitude;
        var radtheta = Math.PI * theta/180;
        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        
        if (dist > 1) {
          dist = 1;
          }
          
          dist = Math.acos(dist);
          dist = dist * 180/Math.PI;
          dist = dist * 60 * 1.1515;
          dist = dist * 1.609344;
          loc.distance = dist;
          
        if (loc.distance <=2) {
          this.$store.state.filterLocation.push(loc);
          }});
    },
    freeTextSearch() {
      this.resetFilterCriteria();
      this.resetTimeNow();
      this.resetUserLocation();
      this.$store.state.filterLocation = [];
      let filter = document.getElementById('filterText');
      this.$store.state.searchText = filter.value;
      this.$store.state.locations.forEach((loc) => {
        if ((loc.categories.toLowerCase().includes(filter.value.toLowerCase())) || (loc.locationName.toLowerCase().includes(filter.value.toLowerCase())) || (loc.description.toLowerCase().includes(filter.value.toLowerCase()))) {
          this.$store.state.filterLocation.push(loc);
        }
      });
      this.$router.push({name: 'search-result'});
    },
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
    searchByIsOpen() {
      this.resetSearchText();
      this.resetFilterCriteria();
      this.resetUserLocation();
      let today = new Date();
      let userCurrentTime = today.getHours() + ":" + today.getMinutes();
      this.$store.state.timeNow = userCurrentTime;
     this.$store.state.filterLocation = [];
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
     
    this.$store.state.filterLocation = [];
      if (navigator.geolocation) {
        let self = this
        navigator.geolocation.getCurrentPosition(function(position) {
          let coordinates = [position.coords.latitude, position.coords.longitude];
           self.$store.state.userLocation.lat = coordinates[0];
           self.$store.state.userLocation.long = coordinates[1];

          self.calculateDistance();

          //  self.$store.state.locations.forEach((loc) => {
          //    if (loc.distance <= 2) {
          //     self.$store.state.filterLocation.push(loc);
          //     }
          //   });
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
  },
  computed: {

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
  overflow: hidden;
}


div.mainImage>img{
  position: relative;
  overflow-x: hidden;
}

div.img-search-container {
  height: 100%;
  width: auto;
}

  /* div.imageContainer { 
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}  */

/* div.imageContainerFirstRow {
   display: flex;
   justify-content: space-between;
   width: 100%;
  
  }
 
 div.imageContainerSecondRow {
   display: flex;
   justify-content: space-between;
   width: 100%;
 } */
 
  .categoryImage {
   position: relative;
   text-align: center;
   color: white;
   padding-right: 5px;  
 }

/* For scroll-bar */

/* div.imageContainer { 
  overflow-x: scroll;
  overflow-y: hidden;
  white-space: nowrap;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
} */

/* .categoryImage {
  display: inline-block;
  color: white;
  padding: 5px;
  
} */

/* Need to fix display on text for images */

   .categoryImage:hover {
  cursor: pointer;
  opacity: 1;
	-webkit-animation: flash 1.5s;
	animation: flash 1.5s;
}

.home-info {
  display: flex;
  margin-top: 5px;
    flex-direction: column;
    justify-content: center;
    max-width: 1200px;
    align-items: center;
    margin-left: auto;
    margin-right: auto;
    background-color: #AACCE1;
    font-family: 'Oswald', sans-serif
}

  .home-info>p {
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 5px;
    margin-top: 0px;
  }

  .home-info>h2 {
    margin-bottom: 0px;
    margin-top: 0px;
  }

/* Temporary effect on category images */
@-webkit-keyframes flash {
	0% {
		opacity: .4;
	}
	100% {
		opacity: 1;
	}
}
@keyframes flash {
	0% {
		opacity: .4;
	}
	100% {
		opacity: 1;
	}
}
  


   .imageText {
  position: absolute;
  top: 80%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 32px;
  font-family:Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  font-weight:bolder;
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: black;
}  

ul.social-icons {
  margin-top: 8px;
  margin-left: auto;
  margin-right: auto;
  max-width: 600px;
  list-style-type: none;
  padding: 0;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
}


/* not currently using */

/* .grow { 
  transition: all .2s ease-in-out; 
}

.grow:hover { 
  transform: scale(1.1);
} */



@media(min-width: 821px){
  .categoryImage>img {
    width: 200px;
  }

  div.search-box{
  display: flex;
  justify-content: center;
  margin-top: -35px;
  padding-bottom: 20px;
  transform: scale(1.50);
  z-index: 1;
  width: 100vw;
}
}

@media(max-width: 820px){
  .categoryImage>img {
    width: 150px;
  }

  div.search-box {
    justify-content: center;
    width: 100vw;
    margin-bottom: 10px;
    }

  input {
  width: 78vw;
  }
}

@media(max-width: 720px){
  div.search-box {
  width: 100vw;
  margin-bottom: 10px;
  }
  input {
  width: 70vw;
  }
}

@media(min-width: 576px){
  div.imageContainer { 
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
  } 
}


@media(max-width: 575px) {
  
  div.image-search-container {
    display: flex;
    justify-content: center;
  }
  div.mainImage {
    width: 100vw;
    }

  div.search-box {
    justify-content: center;
    margin: 0;
    }

  div.imageContainer { 
    overflow-x: scroll;
    overflow-y: hidden;
    white-space: nowrap;
    max-width: 100vw;
  } 

  .categoryImage {
    display: inline-block;
    color: white;
    padding: 5px;
  }

  div.search-box{
  display: flex;
  justify-content: center;
  padding-bottom: 3px;
}

  input {
    width: 68vw;
  }
}

@media(max-width: 500px) {
  input {
    width: 60vw;
  }
}

@media(max-width: 400px) {
  input {
    width: 55vw;
  }
}

@media(max-width: 350px) {
  input {
    width: 50vw;
  }
}




</style>