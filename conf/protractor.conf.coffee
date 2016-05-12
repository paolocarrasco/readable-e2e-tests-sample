require "coffee-script/register"

ScreenShotReporter = require "protractor-screenshot-reporter"
rimraf = require "rimraf"
screenshotsDir = "tmp/screenshots"

exports.config =
  seleniumAddress: "http://localhost:4444/wd/hub"
  specs: ["../e2e/**/*.coffee"]
  capabilities:
    browserName: "chrome"
    chromeOptions:
      args: ["--test-type", "--disable-web-security"]

  baseUrl: (process.env.MOCKAROO_URL || "https://www.mockaroo.com")

  jasmineNodeOpts:
    isVerbose: true
    defaultTimeoutInterval: 20000
    print: ->

  onPrepare: ->
    browser.ignoreSynchronization = true

    SpecReporter = require('jasmine-spec-reporter')
    jasmine.getEnv().addReporter(new SpecReporter({displayStacktrace: 'all'}))

    browser.driver.manage().window().maximize()

    require('jasmine-given')

    rimraf screenshotsDir, ->
      jasmine.getEnv().addReporter new ScreenShotReporter
        takeScreenShotsOnlyForFailedSpecs: true
        baseDirectory: screenshotsDir
        pathBuilder: pathBuilder = (spec, descriptions) ->
          descriptions.join(" en ")
