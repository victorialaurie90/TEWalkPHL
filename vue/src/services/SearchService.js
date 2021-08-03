import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:8080"
});

export default {

  getSearchResults() {
    //TODO: change path to match the back-end controller 
    return http.get('/locations');

  }

}