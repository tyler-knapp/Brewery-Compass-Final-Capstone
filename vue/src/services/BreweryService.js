import axios from 'axios';

export default {

    findAll(){
        return axios.get('/breweries')
    }
}
