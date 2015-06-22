var gulp        = require('gulp'),
  minifyCSS     = require('gulp-minify-css'),
  sass          = require('gulp-sass'),
  browserify    = require('gulp-browserify'),
  browserSync   = require('browser-sync'),
  uglify        = require('gulp-uglify'),
  rename        = require('gulp-rename'),
  jshint        = require('gulp-jshint'),
  jshintStyle   = require('jshint-stylish'),
  notify        = require('gulp-notify'),
  beep          = require('beepbeep'),
  colors        = require('colors'),
  plumber       = require('gulp-plumber'),
  path          = require('path');

// error handling convenience wrapper
gulp.plumbedSrc = function(){
  return gulp.src.apply(gulp, arguments)
    .pipe(plumber({
      errorHandler: function(err) {
        beep();
        console.log('[ERROR:]'.bold.red);
        console.log(err.messageFormatted);
        this.emit('end');
      }
    }));
};

gulp.task('browser-sync', function() {
  browserSync({
    server: {
      baseDir: path.join(__dirname, 'build')
    },
    host: 'localhost',
    port: 8000,
    open: false
  });
});

gulp.task('sass', function () {
  return gulp.plumbedSrc('sass/**/*.scss')
    .pipe(sass())
    .pipe(minifyCSS())
    .pipe(gulp.dest('./build/css/'))
    .pipe(notify({ message: 'CSS complete' }));
});

gulp.task('jshint', function() {
  return gulp.plumbedSrc('./js/**/*.js')
    .pipe(jshint())
    .pipe(jshint.reporter(jshintStyle))
    .pipe(jshint.reporter('fail'))
    .pipe(notify({ message: 'JSHint complete' }));
});

gulp.task('watch', ['browser-sync'], function() {
  gulp.watch('sass/**/*.scss', ['sass']);
  gulp.watch('js/**/*.js', ['jshint', 'scripts']);
});

gulp.task('default', ['watch']);
