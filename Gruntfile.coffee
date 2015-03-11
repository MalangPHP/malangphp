# Build system Configuration
# ==========================

module.exports = (grunt) ->

  # Variables
  # =========
  pkg      = grunt.file.readJSON('./package.json')
  npm_dir  = './node_modules'
  src_dir  = './themes/default'
  dist_dir = './themes/default/dist'

  require('load-grunt-tasks') grunt

  grunt.initConfig

    pkg: pkg

    # Notify
    # ======
    notify:
      build:
        options:
          title: pkg.name + '#' + pkg.version
          message: 'Build finished'

    # Watcher
    # =======
    watch:
      config:
        files: ['./Gruntfile.coffee']
        options:
          reload: true
      scripts:
        files: [src_dir + '/js/{,*/}*.js']
        tasks: ['jshint', 'uglify:dev']
        options:
          spawn: false
      lass:
        files: [src_dir + '/less/{,*/}*.less']
        tasks: ['less:dev']
        options:
          livereload: false
      styles:
        files: [dist_dir + '/style.css']
        options:
          livereload: true
      static:
        files: [
          src_dir + '/images/{,*/}*.{png, jpg, jpeg, svg}'
          src_dir + '/{,*/}*.{twig, html}'
          './content/{,*/}*.md'
        ]
        options:
          livereload: true

    # LESS
    # ====
    less:
      dist:
        options:
          paths: [
            npm_dir + '/lesshat/build'
            src_dir + '/less'
          ]
          compress: true
          plugins: [
            new (require('less-plugin-autoprefix'))(
              browsers: ['last 2 versions']
            )
            new (require('less-plugin-clean-css'))(
              keepSpecialComments: 0
              keepBreaks: false
            )
          ]
          sourceMap: false
        files:
          './themes/default/dist/style.css' : './themes/default/less/main.less'
      dev:
        options:
          paths: [
            npm_dir + '/lesshat/build'
            src_dir + '/less'
          ]
          sourceMap: true
        files:
          './themes/default/dist/style.css': './themes/default/less/main.less'

    # Uglify
    # ======
    uglify:
      options:
        mangle: true
      dist:
        files:
          dist_dir + '/main.min.js' : src_dir + '/js/main.js'

    # CSSMin
    # ======
    cssmin:
      dist:
        options:
          banner: '/* Style definition for ' + pkg.name + '#' + pkg.version + '\n Generated on ' + grunt.template.today('mm-dd-yyyy:hhMMss') + ' */'
          keepSpecialComments: '0'
        files:
          dist_dir + '/style.min.css' : dist_dir + '/style.css'

    # Clean
    # =====
    clean:
      dist:
        files: [
          dot: true
          src: [
            'dist_dir/*.css'
            'dist_dir/*.js'
          ]
        ]

  grunt.registerTask 'default', ['work']
  grunt.registerTask 'work', [
    'clean:dist'
    'less:dev'
    'watch'
  ]
  grunt.registerTask 'build', [
    'clean:dist'
    'less:dist'
    'uglify:dist'
    'cssmin:dist'
    'notify:build'
  ]
  grunt.registerTask 'heroku:production', ['build']

