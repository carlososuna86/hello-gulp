var http = require("http");
var express = require("express");


console.log("Creating web server");
var serverOptions = express();

function serverListener(request, response) {
  console.log(request.method + " " + request.host + ":" + request.port);
}

var httpServer = http.createServer(serverOptions, serverListener);

const PORT=8000;
httpServer.listen(PORT, (err) => {
  if (err) {
    console.log("[Error starting server]");
    console.log(err);
  } else {
    console.log("Server listening on port " + PORT);
  }
});

