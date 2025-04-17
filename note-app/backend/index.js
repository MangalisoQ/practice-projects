const dotenv = require("dotenv");
dotenv.config();
const express = require("express");
const app = express();
const cors = require("cors");

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
  res.json(notes);
});

app.post("/notes", (req, res) => {
  const body = req.body;
  console.log(req.body);
  if (!body.content) {
    return response.status(400).json({
      error: "content missing",
    });
  }
  const savedNote = { id: body.id, content: body.content };
  notes.push(savedNote);
  res.json(savedNote);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
