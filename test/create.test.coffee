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
        name: 'group-test'
      .end (res) ->
        res.status.should.equal 200
        res.body.name.eql 'group-test'
        done()
