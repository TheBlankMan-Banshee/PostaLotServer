"use strict";

"use strict";

// const { Application } = require("loopback");
// const { router } = require("../server");
var express = require('express')
var router = express.Router()

module.exports = function(server){
    const cloudinary = require("cloudinary");
    cloudinary.config({
        cloud_name: server.get('cloudinary_name'),
        api_key: server.get('cloudinary_api_key'),
        api_secret: server.get('cloudinary_api_secret')
    });
    var multer = require('multer');
    var cloudinaryStorage = require('multer-storage-cloudinary');
    var storage = cloudinaryStorage({
        cloudinary: cloudinary,
        folder: 'images',
        filename: function (req, file, cb){
            cb(undefined, file.filename + '-' + Date.now());
        }
    });

    var parser = multer({ storage: storage});
    const routerPath = "/Photo";
    router.post("/upload", parser.array('images', 10), async function(req, res){
        res.send(req.files[0]);
    });

    server.use(routerPath, router);

};
