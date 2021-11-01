var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const bcrypt = require('bcryptjs');
const cors = require('cors'); 
const knex = require('knex'); 

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
const register = require('./controllers/register');
const signIn = require('./controllers/signin');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(cors());
app.use(express.static(path.join(__dirname, 'build'))); //get request, serves static files

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

const db = knex({
  client: 'pg',
  connection: {
    connectionString : process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false,
    },
  },
});

//Keep client routing functional
app.get('/*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

app.post('/signin', signIn.handleSignIn(db,bcrypt)); // receives req and res in js file

app.post('/register',(req,res) => register.handleRegister(req,res,db,bcrypt)); // dependency injection: passing required objects so we don't need to import them

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;