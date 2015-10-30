require! assert
require! 'prelude-ls': { map, apply, fold }

output = ({ msg, error }) ->
  if   error
  then console.error msg, 'fail', error
  else console.log msg, 'good'

test = (state, options) -> (msg, fn) ->
  try fn state, options.assert catch error
  output { msg, error }

api = { test }
api-fns = Object.keys api

prep = (state, options) -> (fn-name) ->
  [fn-name, api[fn-name] state, options]

build = (acc, tuple) ->
  acc[tuple[0]] = tuple[1]
  acc

configure = (options = {}) ->
  state = []
  options.assert ?= assert
  prepped = map (prep state, options), api-fns
  fold build, {}, prepped

module.exports = configure
