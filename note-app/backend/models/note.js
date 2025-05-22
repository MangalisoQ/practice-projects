import { set, connect, Schema, model } from "mongoose"
set("strictQuery", false)

const url = "mongodb://root:example@mongo:27017/notes-db?authSource=admin"


console.log("Connecting to ", url)

connect(url)
     .then(result=>{
     
        console.log("connected to MongoDB")
     })
     .catch(error=>{
        console.log("error connecting to MongoDB:",error.message)
     })

const noteSchema = new Schema({
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
 
 export default model('Note', noteSchema)