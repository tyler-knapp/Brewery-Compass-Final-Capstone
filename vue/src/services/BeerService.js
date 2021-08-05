import axios from 'axios';

export default {
    getAllBeersByBreweryId(breweryID) {
        return axios.get(`/breweries/${breweryID}/beers`)
    },

    getBeer(beerID, breweryID) {
        return axios.get(`/breweries/${breweryID}/beers/${beerID}`)
    }


}