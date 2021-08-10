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

       // console.log(brewery.id, "update called")
        return axios.put(`/breweries/${brewery.breweryId}`, brewery)
    }
}
