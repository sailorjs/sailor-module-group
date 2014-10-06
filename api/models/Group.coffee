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

    tags    : type: 'string'
    user    : collection: 'User'
    request : collection: 'User'

    getUserCount: ->
      @user.length

    getRequestCount: ->
      @request.length

    toJSON: (done) ->
      obj = @toObject()
      delete obj.user
      delete obj.request
      obj.users = @getUserCount()
      obj.requests = @getRequestCount()
      sort obj
