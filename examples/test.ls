configure = require '../src/index.ls'
{ test } = configure!

test 'it works', (state, assert) ->
  assert.equal 2, 2
