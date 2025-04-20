const mongoose =  require("mongoose")
mongoose.set("strictQuery", false)

const url = "mongodb://mike:1234@mongo:27017/notes_db"

console.log("Connecting to ", url)

mongoose.connect(url)
     .then(result=>{
     
        console.log("connected to MongoDB")
     })
     .catch(error=>{
        console.log("error connecting to MongoDB:",error.message)
     })

const noteSchema = new mongoose.Schema({
   content: String,
   title: String,
})

noteSchema.set('toJSON', {
   transform: (document, returnedObject) => {
     returnedObject.id = returnedObject._id.toString()
     delete returnedObject._id
     delete returnedObject.__v
   }
 })
 
 module.exports = mongoose.model('Note', noteSchema)