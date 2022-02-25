import axios from 'axios';

export const DogsService = {
    async getAll() {
        return axios.get('http://localhost:8000/api/dogs')
    },


    async getById(id) {
        return axios.get('http://localhost:8000/api/dogs/' + id)
    },

    async add(dog) {
        console.log(dog)
        return axios.post('http://localhost:8000/api/dogs', dog)
    }

};
export default { DogsService };