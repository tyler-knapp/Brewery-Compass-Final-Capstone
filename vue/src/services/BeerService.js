import axios from 'axios';

export default {
    getAllBeersByBreweryId(breweryID) {
        return axios.get(`/breweries/${breweryID}/beers`)
    },

    getBeer(beerID, breweryID) {
        return axios.get(`/breweries/${breweryID}/beers/${beerID}`)
    },
    addBeer(beer){
        return axios.post(`/breweries/${beer.breweryId}/beers`, beer)

    }


}