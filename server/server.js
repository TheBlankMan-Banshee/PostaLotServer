// Copyright IBM Corp. 2016,2019. All Rights Reserved.
// Node module: loopback-workspace
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
'use strict';

// require('@babel/register');

// const express = require('express');
// const serverMiddleware = require('./src/server').default;
// const cookiesMiddleware = require('universal-cookie-express');

// app
//   .use('./assets', express.static('dist'))
//   .use(cookiesMiddleware())
//   .use(serverMiddleware);

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

app.models.Album.observe ('before delete', function(album, next){
  console.log("Album with id ", album.id, " to be deleted");
  app.models.PhotosInAlbum.destroyAll({
    albumid:album.id
  }, (err, result)=>{
    if(!err && result){
      console.log ("Photos Deleted from album", result);
    }else{
      console.log("There was an error deleting photos from the album ", err);
    }
  })
  return next();
});

app.models.user.afterRemote('fetch', (ctx, user, next)=>{
  console.log(user, " Logged in");
  app.models.UserLogin.create({
    userid: user.id,
    logindate: new Date()
  }, (err, result) => {
    if(!err && result){
      console.log("Created New UserLogin Entry", result);
    }else{
      console.log("There is an error", err);
    }
  })
  next();
});

app.models.user.beforeRemote('delete', (ctx, user, next)=>{
  console.log("User to be deleted is ", user);

  app.models.AlbumShareRelationship.delete({
    userid:user.id
  }, (err, result) => {
    if(!err && result){
      console.log("AlbumShareRelationship Deleted", result);
    }else{
      console.log("There is an error deleting the AlbumShareRelationship", err);
    }
  })

  app.models.PhotoShareRelationship.delete({
    userid:user.id
  }, (err, result) => {
    if(!err && result){
      console.log("PhotoShareRelationship Deleted", result);
    }else{
      console.log("There is an error deleting the PhotoShareRelationship", err);
    }
  })

  app.models.photo.delete({
    userid:user.id
  }, (err, result) => {
    if(!err && result){
      console.log("Photo Deleted", result);
    }else{
      console.log("There is an error deleting the photo", err);
    }
  })
  next();
});

 app.models.photo.beforeRemote('delete', (ctx, photo, next)=>{
   console.log("Photo to be deleted is ", photo);

   app.models.MetaData.delete({
     photoid: photo.id
   }, (err, result)=>{
     if(!err, result){
       console.log("Photo Deleted ", result);
     }else{
       console.log("There is an error deletig the photo", err);
     }
   })
   next();
 })