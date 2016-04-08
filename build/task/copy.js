var path         = require('path');
var gulp         = require('gulp');

var indexSourceFile = path.join(__dirname, '../../resource/index.html');
var testSourceFile = path.join(__dirname, '../../resource/test.html');
var sourceFiles = path.join(__dirname, '../../resource/{img,js,css}/**/*');
var outputPath = path.join(__dirname, '../../bin/');

module.exports = function () {
	gulp.src(indexSourceFile)
		.pipe(gulp.dest(outputPath));
		
	gulp.src(testSourceFile)
		.pipe(gulp.dest(outputPath));
	
	return gulp.src(sourceFiles)
		.pipe(gulp.dest(outputPath));
}