## -- Dependencies -----------------------------------------------------------------------

fs           = require 'fs'
pkg          = require '../package.json'
sailor       = require 'sailorjs'
scripts      = sailor.scripts
forceRequire = require 'force-require'

## -- Setup ------------------------------------------------------------------------------

opts =
  log: level: "silent"

SCOPE =
  TEST         : "#{process.cwd()}/testApp"
  LINK         : "#{process.cwd()}/testApp/node_modules/#{pkg.name}"
  DEPENDENCIES : ['sailor-module-user']

before (done) ->
  if (!fs.existsSync(SCOPE.TEST))
    scripts.newBase ->
      scripts.link SCOPE.LINK
      forceRequire scope: SCOPE.TEST, name: dependency, production: true for dependency in SCOPE.DEPENDENCIES
      scripts.writeModuleFile pkg.name
      scripts.lift SCOPE.TEST, opts, done
  else
    scripts.clean "#{SCOPE.TEST}/.tmp/"
    scripts.lift SCOPE.TEST, opts, done
