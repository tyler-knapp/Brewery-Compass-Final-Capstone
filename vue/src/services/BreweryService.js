import axios from 'axios';

export default {

    findAll(){
        return axios.get('/breweries')
    },

    getBrewery(breweryID){
        return axios.get(`/breweries/${breweryID}`)
    },

    createBrewery(brewery){
        return axios.post('/breweries', brewery)
    }
}
