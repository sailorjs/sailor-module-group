## -- Dependencies -------------------------------------------------------------

sort = require 'sort-keys'

## -- Exports -------------------------------------------------------------

module.exports =
  schema: true

  attributes:
    name     : type: 'string', notNull: true
    summary  : type: 'string', notNull: true
    website  : type: 'string', url: true
    private  : type: 'boolean', defaultsTo: false

    # TODO: type array?
    tags     : collection: 'string'
    members  : collection: 'User'
    requests : collection: 'User'

    toJSON: (done) ->
      obj = @toObject()
      delete obj.members
      delete obj.requests
      sort obj
