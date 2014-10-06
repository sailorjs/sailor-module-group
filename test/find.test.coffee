## -- Dependencies -----------------------------------------------------------------------

should    = require 'should'
request   = require 'superagent'
url       = require './helpers/urlHelper'

## -- Test ------------------------------------------------------------------------------

describe "Find :: /GET group", ->

  describe '200 OK', ->

    it 'get all groups', (done) ->
      request
      .get(url.find)
      .end (res) ->
        res.status.should.equal 200
        res.body.length.should.eql 3
        done()

    it 'get groups by name', (done) ->
      request
      .get(url.find)
      .query
        name: 'ponys'
      .end (res) ->
        res.status.should.equal 200
        res.body[0].name.should.eql 'ponys'
        done()

    it 'get groups by tags', (done) ->
      request
      .get(url.find)
      .query
        tags: contains: 'funny'
      .end (res) ->
        res.status.should.equal 200
        done()
