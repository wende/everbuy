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

@Users.addQuery = (userId, suggestion) ->
  user = Meteor.user()

  #On next tick find suggestions
  if Meteor.isServer then Meteor.setTimeout ->
    SuggestionsFinder.findAll([{userId: userId, queries: [suggestion], suggestions: []}])
  , 0

  @Users.update {_id: userId}, {$push: {"searches.queries": suggestion}}

@Users.removeQuery = (userId, suggestion) ->
  @Users.update {_id: userId}, {$pull: {"searches.queries": {title : suggestion}}}

@Users.getQueries = (userId) ->
  @Users.find {_id: userId}

@Users.addSuggestion = (suggestion) ->
  console.log "Adding suggestion"
  check(suggestion, Object)
  #TODO finish notif
  Notifications.send(suggestion.userId, "Item found!" ,"We found an item You were looking for!")
  Users.update {_id: suggestion.userId},
    {$push:
      "searches.suggestions":
        $each: [suggestion],
        $sort: {_id: -1},
        $slice: -10
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
}
