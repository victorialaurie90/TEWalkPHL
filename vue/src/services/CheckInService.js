import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:8080"
});

export default {
    getCheckIns(id) {
        return http.get(`/profile/${id}`)
    },

}