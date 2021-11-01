const express = require('express');
const bcrypt = require('bcryptjs');
const cors = require('cors'); 
const knex = require('knex'); 
const register = require('./controllers/register');
const signIn = require('./controllers/signin');

const app = express();
const PORT = process.env.PORT || 5000;
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());

const db = knex({
  client: 'pg',
  connection: {
    connectionString : process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false,
    },
  },
});

app.get('/',(req,res) => {
  res.json(db.users);
});

app.post('/signin', signIn.handleSignIn(db,bcrypt));

app.post('/register',(req,res) => register.handleRegister(req,res,db,bcrypt));

app.listen(PORT,() => {
  console.log(`Postalot is running on port ${PORT}`);
});