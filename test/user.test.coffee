## -- Dependencies -----------------------------------------------------------------------

should    = require 'should'
request   = require 'superagent'
url       = require './helpers/urlHelper'
user      = require './helpers/userHelper'

## -- Test ------------------------------------------------------------------------------

describe 'User', ->

  describe "Create :: /POST group/:id/user", ->
    describe '200 OK', ->
      it 'add new user in a group', (done) ->
        request
        .post url.create + "/1/user"
        .send user.generate()
        .end (res) ->
          res.status.should.equal 200
          res.body.users.should.eql '1'
          done()


  describe "Find :: /GET group/:id/user", ->
    describe '200 OK', ->
      it 'get all user from a group', (done) ->
        request
        .get url.find + "/1/user"
        .end (res) ->
          res.status.should.equal 200
          res.body[0].username.should.equal 'user1'
          done()
