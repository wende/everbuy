@SuggestionsFinder = {

  getItemsCount: (query) ->
    #0 makes it reduce with initial value
    results = [0]
    allegro = Allegro.getItemsCount(query)
    results.concat allegro
           .reduce (a,b) => a + b 
    
  find : (query)->
    results = []
    allegro = Allegro.searchItem(query)
    #TODO other providers
    results.concat allegro

  ###*
  searches : [{userId: String, queries&suggestions : [{title: String, priceBot: Number, priceTop: Number}]}]
  ###
  findAll : (searches) ->
    searches.map (user) =>
      userId = user.userId
      alreadyFound = (user.suggestions.map (a) -> a.suggestion.itemId).filter((a) -> a)
      console.log("alreadyFound")
      console.log(alreadyFound)
      results = user.queries
        .filter (query) -> !query.disabled
        .map (query) => {result: @find(query).filter((a) -> !(a.itemId in alreadyFound)), query: query, userId: userId}
        .map (search) ->
          search.result = search.result.filter (a) ->
            above = if search.query.priceBottom  then a.price > search.query.priceBottom  else true
            under = if search.query.priceTop     then a.price < search.query.priceTop     else true
            above && under
          search
        .filter (a) -> a.result.length
        .map (result) -> SuggestionsFinder.handleTheResult(result)

  handleTheResult : (result) ->
    conclusion = SuggestionsAnalyzer.analyzeResult(result)
    if conclusion == "too_much" then  Meteor.call("disableQuery", result.userId, result.query.title)
    Meteor.call "addSuggestion", {
      conclusion: conclusion
      query : result.query
      suggestion: result.result[0]
      userId: result.userId
      price: result.result[0].price
      timeToEnd: result.timeToEnd
    }
}
