'use strict';

import gulp          from 'gulp';
import minifyCSS     from 'gulp-cssnano';
import sass          from 'gulp-sass';
import browserSync   from 'browser-sync';
import uglify        from 'gulp-uglify';
import rename        from 'gulp-rename';
import replace       from 'gulp-replace';
import notify        from 'gulp-notify';
import beep          from 'beepbeep';
import colors        from 'colors';
import plumber       from 'gulp-plumber';
import path          from 'path';
import eslint        from 'gulp-eslint';
import sourcemaps    from 'gulp-sourcemaps';
import source        from 'vinyl-source-stream';
import buffer        from 'vinyl-buffer';
import browserify    from 'browserify';
import babel         from 'babelify';

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

gulp.task('sass', () => {
  return gulp.plumbedSrc('sass/**/*.scss')
    .pipe(sass())
    .pipe(minifyCSS())
    .pipe(gulp.dest('./build/css/'))
    .pipe(notify({ message: 'CSS complete' }));
});

gulp.task('browser-sync', () => {
  browserSync({
    server: {
      baseDir: path.join(__dirname, 'build')
    },
    host: 'localhost',
    port: 8000,
    open: false
  });
});

gulp.task('scripts', () => {
  let bundler = browserify({
    entries: ['./js/main.es6.js'],
    debug: true,
    extensions: [' ', 'js', 'jsx']
  }).transform(babel.configure({
    presets: ["es2015"]
  }));

  bundler.bundle()
    .on('error', function(err) { console.error(err); this.emit('end'); })
    .pipe(source('main.js'))
    .pipe(buffer())
    .pipe(uglify())
    .pipe(sourcemaps.init({ loadMaps: true }))
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest('./build/js'));
});

gulp.task('eslint', () => {
  return gulp.plumbedSrc('./js/**/*.js')
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failAfterError())
    .pipe(notify({ message: 'ESLint complete' }));
});

gulp.task('watch', ['browser-sync'], () => {
  gulp.watch('sass/**/*.scss', ['sass']);
  gulp.watch('js/**/*.js', ['eslint', 'scripts']);
});

gulp.task('default', ['watch']);
