import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import createPersistedState from "vuex-persistedstate";
Vue.use(Vuex)
/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));
if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}
export default new Vuex.Store({
  plugins: [createPersistedState({
    storage: window.sessionStorage,
    //sessionStorage.clear(); to clear the state on logout, etc.
  })],
  state: {
    token: currentToken || '',
    user: currentUser || {},
    userLocation: {
      lat: 0,
      long: 0
    },
    isLoggedIn: false,
    filterCriteria: null,
    searchText: null,
    timeNow: null,
    locations: [
      {distance: -1}
    ],
    filterLocation: [],
    location: {
      locationId: 0,
      locationName: "",
      description: "",
      address: "",
      openTo: "",
      openFrom: "",
      twitter: "",
      url: "",
      facebook: "",
      img: "",
      latitude: 0,
      longitude: 0,
      categories: "",
      distance: -1, 
    },
    allBadges: [],
    badge: {
      badgeId: 0,
      badgeName: "",
      image: "",
      badgeDescription: "",
    },

  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
      state.isLoggedIn = true;
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      state.isLoggedIn = false;
      axios.defaults.headers.common = {};
    },
    SET_LOCATIONS(state, data){
      state.locations = data;
    },
    SET_BADGES(state, data){
      state.allBadges = data;
    },
    SET_FILTER_CRITERIA(state, data) {
      state.filterCriteria = data;
    }
  }
})