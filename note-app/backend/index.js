const dotenv = require("dotenv");
dotenv.config();
const express = require("express");
const app = express();
const cors = require("cors");
const Note = require("./models/note")

app.use(cors());
app.use(express.json());

let notes = [
  { id: 1, title: "Grocery List", content: "Milk, Eggs, Bread" },
  { id: 2, title: "Work Tasks", content: "Finish report, send email" },
  { id: 3, title: "Ideas", content: "Start a blog, learn Docker" },
  { id: 4, content: "HTML is easy" },
  { id: 5, content: "Browser can execute only JavaScript" },
  {
    id: 6,
    content: "GET and POST are the most important methods of HTTP protocol",
  },
];

app.get("/", (req, res) => {
  res.send("Hello world");
});

app.get("/notes", (req, res) => {
  Note.find({}).then(notes=>{
    res.json(notes)
 
  })
});

const generateId = () => {
  const maxId = notes.length > 0
    ? Math.max(...notes.map(n => n.id))
    : 0
  return maxId + 1
}

app.post("/notes", (req, res) => {
  const body = req.body;
  if (!body.content || !body.title) {
    return response.status(400).json({
      error: "missing information",
    });
  }
  const note = new Note({
    content:body.content,
    title:body.title,
})

note.save().then(savedNote=>{
res.json(savedNote)
})
});


app.delete('/notes/:id', (req, res) => {
  const id = Number(req.params.id)
  notes = notes.filter(note => note.id !== id)

  res.status(204).end()
})


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
