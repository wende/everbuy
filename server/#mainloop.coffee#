MINUTE = 1
HOUR = 60 * MINUTE
DAY = 24 * HOUR

ticks = 0
queries = []

every = (period, fn) ->
  unless ticks % period then fn()

findAllSuggestions = ->
  queries = Users.find({}).map (a) ->
    if !a.searches then {userId: a._id, queries: [], suggestions:[]}
    else {userId: a._id, queries: a.searches.queries || [], suggestions: a.searches.suggestions || []}
  ts = Date.now()
  results = SuggestionsFinder.findAll(queries)
  searches_l = Stats.countNested(queries, "queries")
  results_l = results.reduce ((a,b) -> a + b.filter (c) -> c.length), 0
  console.log("results")
  console.log(results)
  console.log("Handled #{searches_l} queries and found #{results_l} items in #{Date.now() - ts} milliseconds")
  results

tick = ->
  every DAY, -> ticks = 0
  #every HOUR, findAllSuggestions
  every MINUTE, ->
    results = findAllSuggestions()

  ticks++


Meteor.startup ->
  tick()
  Meteor.setInterval tick, 60 * 1000
