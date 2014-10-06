## -- Dependencies -----------------------------------------------------------------------

should    = require 'should'
request   = require 'superagent'
url       = require './helpers/urlHelper'

## -- Test ------------------------------------------------------------------------------

describe "Create :: /POST group", ->

  describe '200 OK', ->

    it "create a new group", (done) ->
      request
      .post(url.create)
      .send
        name: 'ponys'
      .end (res) ->
        res.status.should.equal 200
        res.body.name.should.eql 'ponys'
        done()

    it "create a new private group", (done) ->
      request
      .post(url.create)
      .send
        name: 'unicorns'
        private: true
      .end (res) ->
        res.status.should.equal 200
        res.body.name.should.eql 'unicorns'
        res.body.private.should.eql true
        done()

    it "create a new group with tags", (done) ->
      request
      .post(url.create)
      .send
        name: 'happywheels'
        tags: 'funny, gracioso'
        private: true
      .end (res) ->
        res.status.should.equal 200
        res.body.name.should.eql 'happywheels'
        res.body.private.should.eql true
        res.body.tags.should.eql 'funny, gracioso'
        done()

  describe '400 badRequest', ->
    it "create a new group without name", (done) ->
      request
      .post(url.create)
      .send()
      .end (res) ->
        res.status.should.equal 400
        done()
