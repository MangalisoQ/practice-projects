import styles from "./Note.module.css";

export const Note = ({ note, deleteNote }) => {

  return (
    <li className={styles.container} >
      <div>{note.content}</div>
      <button
        className={styles["delete-btn"]}
        onClick={() => deleteNote(note.id)}
      >
        Delete
      </button>
    </li>
  );
};
