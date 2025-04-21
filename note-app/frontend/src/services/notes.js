import axios from 'axios'
const baseUrl = '/api/notes'

const getNotes = () => {
  const request = axios.get(baseUrl)
  return request.then(response => response.data)
}

const createNote = newNote => {
  const request = axios.post(baseUrl, newNote);
  return request.then(response => response.data)
}

const updateNote = (id, newNote) => {
  const request = axios.put(`${baseUrl}/${id}`, newNote);
  return request.then((response) => response.data);
};

const deleteNote=(id)=>{
  const request = axios.delete(`${baseUrl}/${id}`);
   return request.then(response => response.data)
}

export default {
  getNotes,
  createNote,
  updateNote,
  deleteNote,
};
