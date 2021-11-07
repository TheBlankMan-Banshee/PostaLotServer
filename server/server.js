// Copyright IBM Corp. 2016,2019. All Rights Reserved.
// Node module: loopback-workspace
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
'use strict';


const loopback = require('loopback');
const boot = require('loopback-boot');

const app = module.exports = loopback();

app.start = function() {
  // start the web server
  return app.listen(function() {
    app.emit('started');
    const baseUrl = app.get('url').replace(/\/$/, '');
    console.log('Web server listening at: %s', baseUrl);
    if (app.get('loopback-component-explorer')) {
      const explorerPath = app.get('loopback-component-explorer').mountPath;
      console.log('Browse your REST API at %s%s', baseUrl, explorerPath);
    }
  });
};

// Bootstrap the application, configure models, datasources and middleware.
// Sub-apps like REST API are mounted via boot scripts.
boot(app, __dirname, function(err) {
  if (err) throw err;

  // start the server if `$ node server.js`
  if (require.main === module)
    app.start();
});

app.models.user.afterRemote('create', (ctx, user, next)=>{
  console.log("New User is ", user);
  app.models.UserLogin.create({
    userloginid: user.id,
    username: user.username,
    email: user.email,
    isactive: user.isactive,
    passwordhash : user.password
  }, (err, result) => {
    if(!err && result){
      console.log("Created New UserLogin Entry", result);
    }else{
      console.log("There is an error", err);
    }
  })
  next();
});

// app.models.user.afterRemote('update', (ctx, user, next)=>{
//   console.log("Updated User is ", user);
//   app.models.UserLogin.update({
//     username: user.username,
//     email: user.email,
//     isactive: user.isactive,
//     PasswordHash : user.password
//   }, (err, result) => {
//     if(!err && result){
//       console.log("Updated UserLogin Entry", result);
//     }else{
//       console.log("There is an error", err);
//     }
//   })
//   next();
// });
