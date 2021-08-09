<template>
  <div class="home">
    <h1><em>wlk</em>PHL</h1>
    <p>Find Your Next Favorite Jawn</p>
    <!-- <router-link :to= " { name: 'login'} "><button>Login</button></router-link> -->

    <!-- Maybe have a little welcome message and info about wlkPHL -->
    <ul class="home-info">
      <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
      <li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
      <li>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</li>
      <li>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
    </ul>

      <div class="search-box">
      <form v-on:submit.prevent="freeTextSearch">
          <input type="text" required="required" id="filterText" placeholder="What do you want to do?">
          <button type="submit">Search</button>
      </form>
      </div>
      <!-- Turn the button below into a simpler type button (not a form) -->
        <div class="category-buttons">
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Restaurants')"><i class="fas fa-utensils fa-2x"></i>Restaurants</button>
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Bars')"><i class="fas fa-beer fa-2x"></i>Bars</button>
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Sports')"><i class="fas fa-baseball-ball fa-2x"></i>Sports</button>
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Fine Arts')"><i class="fas fa-theater-masks fa-2x"></i>Fine Arts</button>
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Historic Sites')"><i class="fas fa-landmark fa-2x"></i>Historic Sites</button>
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Parks')"><i class="fas fa-tree fa-2x"></i>Parks</button>
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Indoor')"><i class="fas fa-home fa-2x"></i>Indoor</button>
          <button type="submit" class="grow" v-on:click="applyNameToFilter('Outdoor')"><i class="fas fa-cloud-sun fa-2x"></i>Outdoor</button>
          <button type="submit" class="grow" v-on:click="searchByIsOpen()"><i class="fas fa-clock fa-2x"></i>Open Now</button>
          <button type="submit" v-on:click="searchNearMe()"><i class="fas fa-street-view fa-2x"></i>Near Me</button>
        </div>
      
      
    <!-- <div v-for='location in locations' v-bind:key="location.id">
      <h3>{{location.name}}</h3>
    </div> -->
    <!-- <div class="categories">

    </div> -->
  </div>
</template>

<script>
export default {
// TODO: Reconsider whether we still need searchTerm, resetForm, rename submitSearch() since
// filtering results will happen in JavaScript/front end
  components: {
    
  },
  name: "home",
  // props: ["categories"],
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
     // this.$router.push({name: 'search-result'});
      if (navigator.geolocation) {
        //snapshot of this instance of the component captured in self variable
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

h1{
  font-size: 100px;
  display: flex;
  justify-content: center;
  margin-top:200px;
  margin-bottom: 5px;
}
p{
  font-size: 50px;
  margin-top: 0px;
  margin-bottom: 5px;
  display: flex;
  justify-content: center;
  align-items: center;
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
  padding-top: 50px;
  padding-bottom: 20px;
  transform: scale(1.50)
}

div.category-buttons {
  display: flex;
  justify-content: center;
  align-items: center;
  padding-top: 25px;
}

div.category-buttons>button {
  margin-right: 5px;
  border-radius: 5px;
  padding: 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background: white;
  font-weight: bold;
  font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
    'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji',
    'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
}

div.category-buttons>button:hover {
  background-color: #9ed7fa ;
  cursor: pointer;
}

.grow { 
  transition: all .2s ease-in-out; 
}

.grow:hover { 
  transform: scale(1.1);
}

i {
  color: #7C2D3E;
}

@media(max-width: 1366px) {

  div.category-buttons {
    flex-direction: row;
    flex-wrap: wrap;
    align-items: center;
  }
}

@media(max-width: 1024px) {
  .home {
    transform: scale(.8);
    }

  h1 {
    display: none;
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

  

@media(max-width: 768px) {
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

  div.category-buttons {
    flex-direction: row;
    flex-wrap: wrap;
    align-items: center;
}

  div.category-buttons>button {
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












