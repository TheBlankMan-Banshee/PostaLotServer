// Copyright IBM Corp. 2016,2019. All Rights Reserved.
// Node module: loopback-workspace
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
'use strict';


const loopback = require('loopback');
const boot = require('loopback-boot');
const PORT = process.env.PORT;
const app = module.exports = loopback();

app.start = function() {
  // start the web server
  return app.listen(PORT || 3000, function() {
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


app.models.Album.afterRemote('fetch', (ctx, album, next) => {
  app.models.PhotosInAlbum.get ({
    albumid : album.id
  }, (err, result) => {
    if (!err && result){
      app.models.photo.get ({
        id : result.photoid
      }, (err, result) =>{
        if (!err && result){
          console.log("Photos returned: ", result);
        }else{
          console.log("There is an error", err);
        }
      })
    }else{
      console.log("No photos in album", err);
    }
  })
  next();
});

app.models.MetaData.afterRemote('fetch', (ctx, Metadata, next) => {
  app.models.photo.get ({
    id : Metadata.photoid
  }, (err, result) => {
    if (!err && result){
      console.log("Photos returned: ", result);
    }else{
      console.log("There is an error", err);
    }
  })
  next();
});

var WHITE_LIST_FIELDS =['photoid'];
app.models.MetaData.afterRemote('fetch', (ctx, Metadata, next) => {
  if(ctx.result){
    if (Array.isArray(Metadata)){
      var answer = [];
      ctx.result.forEach(function (result){
        var replacement ={};
        WHITE_LIST_FIELDS.forEach(function(field){
          replacement[field]=result[field];
        });
        answer.push(replacement);
      });
    }else{
      var answer = {};
      WHITE_LIST_FIELDS.forEach(function(field){
        answer[field] = ctx.result[field];
      });
    }
    ctx.result = answer;
  }
  next();
});
// app.models.user.afterRemote('create', (ctx, user, next)=>{
//   console.log("New User is ", user);
//   app.models.UserLogin.create({
//     userloginid: user.id,
//     username: user.username,
//     email: user.email,
//     isactive: user.isactive,
//     passwordhash : user.password
//   }, (err, result) => {
//     if(!err && result){
//       console.log("Created New UserLogin Entry", result);
//     }else{
//       console.log("There is an error", err);
//     }
//   })
//   next();
// });

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
