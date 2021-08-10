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
    },

    updateBrewery(brewery) {
        return axios.put(`/breweries/${brewery.id}`, brewery)
    },
    searchBrewery(){
        return axios.get('https://api.openbrewerydb.org/breweries')
    }
}
