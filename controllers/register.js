const handleRegister = (req,res,db,bcrypt) => {
    let hashed = '';
    const {email, name, password} = req.body;
    // NB! Server and client should do error handling respectively
    if (!email || !name || !password) { // if either of the objects doesn't exist
       return res.status(400).json('All fields must be filled in');
    }
    bcrypt.hash(password, null, function(err, hash) {
        hashed = hash;
    });
    db.transaction(trx => { // transaction knex function
        trx.insert({
            PasswordHash: hashed,
            Email: email,
            Username: name,
            IsActive: true
        })
        .into('UserLogin')
        .returning('Email')
        .then(loginmail => {
           trx('UserLogin').returning('*').insert({ 
                Email: loginmail[0],
                Username: name,
                IsActive: true
            })
            .then(user => {
                res.json(user[0]);
            })
            .then(trx.commit)
            .catch(trx.rollback); 
        });
    })
    .catch(err => res.status(400).json('Failed to register user'));
};

module.exports = {
    handleRegister: handleRegister
};