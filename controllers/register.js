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
            hash: hashed,
            email: email
        })
        .into('UserLogin')
        .returning('email')
        .then(loginmail => {
           trx('users').returning('*').insert({ 
                email: loginmail[0],
                name: name,
                joined: new Date()
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