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
<<<<<<< HEAD
        return axios.put(`/breweries/${brewery.id}`, brewery)
    },
    searchBrewery(){
        return axios.get('https://api.openbrewerydb.org/breweries')
=======
       // console.log(brewery.id, "update called")
        return axios.put(`/breweries/${brewery.breweryId}`, brewery)
>>>>>>> 2feaf3b47dc59fbe43e90a2b1c3f96119dbb6829
    }
}
