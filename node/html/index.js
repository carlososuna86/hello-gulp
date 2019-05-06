var http = require("http");
var express = require("express");


var app = express();

console.log("Creating web server");
var httpServer = http.createServer(app);

const PORT=8000;
httpServer.listen(PORT, (err) => {
  if (err) {
    console.log("[Error starting server]");
    console.log(err);
  } else {
    console.log("[Server ready]");
  }
});

