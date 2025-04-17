import { useState } from "react";
import styles from "./NoteInput.module.css"

export const NoteInput = ({addNote}) => {
  const [note, setNote] = useState("");

  const handleAddNote=(e)=>{
    e.preventDefault()
    addNote({ id: Date.now(), content: note });
    setNote("")
  }

  return (
    <div className={styles.container}>
      <form onSubmit={handleAddNote} className={styles.form}>
        <input
          name="noteInput"
          value={note}
          onChange={(e) => setNote(e.target.value)}
          className={styles["note-input"]}
        />
        <button className={styles["add-btn"]}>Add</button>
      </form>
    </div>
  );
};
