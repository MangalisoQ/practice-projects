db.createUser(
        {
            user: "docker",
            pwd: "1234",
            roles: [
                {
                    role: "readWrite",
                    db: "notes_db"
                }
            ]
        }
);
