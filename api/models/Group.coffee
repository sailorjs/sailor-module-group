## -- Dependencies -------------------------------------------------------------

sailor = require 'sailorjs'
sort = sailor.util.sortKeys

## -- Exports -------------------------------------------------------------

module.exports =
  schema: true

  attributes:
    name     : type: 'string', unique: true, required: true
    title    : type: 'string'
    summary  : type: 'string'
    website  : type: 'string', url: true
    private  : type: 'boolean', defaultsTo: false

    tags     : type: 'array'
    members  : collection: 'User'
    requests : collection: 'User'

    toJSON: (done) ->
      obj = @toObject()
      delete obj.members
      delete obj.requests
      sort obj
