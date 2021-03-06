MAX_ITEM_COUNT = 5

@Users = Meteor.users

@Schemas = {}

Meteor.startup ->
  @Schemas.QuerySchema = new SimpleSchema {
    title:
      type: String
      label: i18n "query.title"
      optional: false
    priceBottom:
      type: Number
      label: i18n "query.price_bottom"
      optional: true
    priceTop:
      type: Number
      label: i18n "query.price_top"
      optional: true
  }, {strict: false}


@Users.allow {
  insert: (userId, doc) ->
    doc.userId == userId
  update: (userId, doc) ->
    doc.userId == userId
}

@Users.addQuery = (userId, query) ->
  user = Meteor.user()
 
  if Meteor.isServer
    count = SuggestionsFinder.getItemsCount(query)
    if count > MAX_ITEM_COUNT then throw new Meteor.Error(400, count ,"Too many items")
    #On next tick find suggestions
    Users.addSuggestion CardFactory.startedLooking(query, userId)

    Meteor.setTimeout ->
      SuggestionsFinder.findAll([{userId: userId, queries: [query], suggestions: []}])
    , 0

  @Users.update {_id: userId}, {$push: {"searches.queries": query}}

@Users.removeQuery = (userId, suggestion) ->
  @Users.update {_id: userId}, {$pull: {"searches.queries": {title : suggestion}}}

@Users.getQueries = (userId) ->
  @Users.find {_id: userId}

@Users.addSuggestion = (suggestion) ->
  check(suggestion, Object)
  console.log "Adding suggestion"
  #console.log suggestion
  suggestion.createdAt = new Date()
  if suggestion.conclusion == "found"
    Notifications.send(suggestion.userId, "Item found!" ,"We've found #{suggestion.query.title} for You!")
  Users.update {_id: suggestion.userId},
    {$push:
      "searches.suggestions":
        $each: [suggestion],
        $sort: {createdAt: 1},
        $slice: -20
    }

@Users.removeSuggestion = (userId, suggestion) ->
  @Users.update {_id: userId}, {$pull: {"searches.suggestions": suggestion}}

@Users.getSuggestions = (userId) ->
  @Users.find {_id: userId}

ifUser = (fn) -> (doc) ->
  userId = Meteor.userId()
  if userId == doc.userId || !doc.userId
    fn(userId, doc)
  else
    throw new Meteor.Error("access")

Meteor.methods {
  addQuery          : ifUser @Users.addQuery
  removeQuery       : ifUser @Users.removeQuery
  getQueries        : ifUser @Users.getQueries

  addSuggestion     : @Users.addSuggestion
  removeSuggestion  : ifUser @Users.removeSuggestion
  getSuggestions    : ifUser @Users.getSuggestions

  disableQuery      : (id, title) -> Users.update {_id: id, "searches.queries.title": title},
                                                  {$set : "searches.queries.$.disabled": true}
  getItemsCount   : (query) ->
    if not this.isSimulation
      r = SuggestionsFinder.getItemsCount(query)
      console.log(r)
      r
}
