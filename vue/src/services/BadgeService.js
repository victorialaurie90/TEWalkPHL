import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:8080"
});

export default {
    getBadges(id) {
        return http.get(`/profile/${id}/badges`)
    },
    awardBadge(id) {
        return http.post(`/profile/${id}/badges`)
    },
    getAllBadges(id) {
        return http.get(`/badges/${id}`)
    }
}