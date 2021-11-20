"use strict";

"use strict";

// const { Application } = require("loopback");
// const { router } = require("../server");


module.exports = function(server){
    const cloudinary = require("cloudinary");
    // cloudinary.config({
    //     cloud_name: server.get('cloudinary_name'),
    //     api_key: server.get('cloudinary_api_key'),
    //     api_secret: server.get('cloudinary_api_secret')
    // });
    const {CloudinaryStorage} = require('multer-storage-cloudinary');
    const multer = require('multer');
    const express = require('express');
    const app = express();
    const router = express.Router();

    const storage = new CloudinaryStorage({
        cloudinary: cloudinary,
        params: {
            folder: 'images',
            format: async (req,res)=> 'png',
            public_id: (req, file) =>  file.filename + '-' + Date.now(),
        }
        
        
        // allowedFormats: ['jpg', 'jpeg', 'png','tiff','gif'],
        // filename: function (req, file, cb){
            
        
    });

    var parser = multer({ storage: storage});
    const routerPath = "/Photo";
    router.post("/upload", parser.array('images', 10), async function(req, res){
        res.send(req.files[0]);
    });

    server.use(routerPath, router);

};
