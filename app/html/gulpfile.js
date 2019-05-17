/* ******* *
 * modules *
 * ******* */
var gulp = require("gulp");
var clean = require("gulp-clean");
var connect = require("gulp-connect");
var yarn = require("gulp-yarn");

// task: clean
function gulpClean(cb) {
  return cb();
}
gulp.task("clean", gulpClean);


// task: yarn
function gulpYarn(cb) {
  return cb();
}
gulp.task("yarn", gulpYarn);


// task: compile
function gulpCompile(cb) {
  return cb();
}
gulp.task("compile", gulpCompile);


// task: connect
function gulpConnect(cb) {
  var options = {
      host: [ "localhost" ],
      port: 8000,
//      root: "./",
      livereload: true,
//      fallback: "index.html"
  };
  connect.server(options, cb);
}
gulp.task("connect", gulpConnect);


// task: build
gulp.task("build", gulp.series("clean", "yarn", "compile"));


// task: default
gulp.task("default", gulp.series("connect"));

