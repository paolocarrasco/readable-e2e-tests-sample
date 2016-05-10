
module.exports = function(grunt) {
  'use strict';

  // Load grunt tasks automatically
  require('load-grunt-tasks')(grunt);

  // Define the configuration for all the tasks
  grunt.initConfig({

    protractor_webdriver: {
      e2eStart: {
        options: {
          path: './node_modules/.bin/',
          command: 'webdriver-manager start --standalone'
        }
      }
    },

    protractor: {
      options: {
        keepAlive: false,
        noColor: false,
        args: {},
      },
      e2e: {
        configFile: 'conf/protractor.conf.coffee'
      }
    }

  });

  grunt.registerTask('e2e', 'Corre las pruebas end-to-end del portal', [
    'protractor_webdriver:e2eStart',
    'protractor:e2e'
  ]);
};
