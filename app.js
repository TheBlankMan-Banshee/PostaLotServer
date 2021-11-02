const express = require('express');
const bcrypt = require('bcryptjs');
const cors = require('cors'); 
const knex = require('knex'); 
const register = require('./controllers/Register');
const signIn = require('./controllers/signIn');

const app = express();
const PORT = process.env.PORT || 5000;
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(function(req,res,next){
  res.header("Access-Control-Allow_Origin", "https://postalot-client.herokuapp.com");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
}); 
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

app.post('/signIn', signIn.handleSignIn(db,bcrypt));

app.post('/Register',(req,res) => register.handleRegister(req,res,db,bcrypt));

app.listen(PORT,() => {
  console.log(`Postalot is running on port ${PORT}`);
});