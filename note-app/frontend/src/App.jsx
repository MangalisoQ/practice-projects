import { useEffect, useState } from "react";
import styles from "./App.module.css";
import { NoteInput } from "./components/NoteInput";
import { NoteList } from "./components/NoteList";
import NoteService from "./services/notes"

function App() {
  const [notes, setNotes] = useState([]);

  useEffect(()=>{
    NoteService
      .getNotes()
      .then((noteList)=>{
        console.log(noteList)
        setNotes(noteList)
      })
      .catch((err)=>{
        console.log(err," Something went wrong with fetching notes")

      })
  },[])

  const addNote=(note)=>{
    NoteService
      .createNote(note)
      .then((rNote)=>{
        setNotes([...notes,rNote])
      })
   // console.log(notes)
  }

  const deleteNote=(id)=>{
    setNotes((prevState)=>prevState.filter((note)=>note.id != id))
  }

  console.log(notes)

  return (
    <div className={styles.container}>
      <NoteInput addNote={addNote}/>
      <NoteList notes={notes} deleteNote={deleteNote}/>
    </div>
  );
}

export default App;
