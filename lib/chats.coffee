@Chats = new Mongo.Collection("chats")

Chats.allow {
  insert: (userId, doc) ->  doc.userId == userId
}

Meteor.methods {
  sendChatMessage: (message, loc) ->
    check Meteor.userId(), String
    check message, String
    check(loc, Match.OneOf(Object, null))

    message = {message}
    message.userId = Meteor.userId();
    message.userAvatar = Meteor.user().services.twitter.profile_image_url_https
    message.userName = Meteor.user().profile.name
    message.date = new Date()

#    if !this.isSimulation && loc
#      message.place = getLocationPlace(loc)

    Chats.insert message
}

if Meteor.isServer
  twitterOauth = (options) ->
    config = Meteor.settings.twitter
    userConfig = Meteor.user().services.twitter;
    {
      consumer_key: config.consumerKey,
      consumer_secret: config.secret,
      token: userConfig.accessToken,
      token_secret: userConfig.accessTokenSecret
    }

  getLocationPlace = (loc) ->
    url = "https://api.twitter.com/1.1/geo/reverse_geocode.json?granularity=neighborhood&max_results=1" +
      "&accuracy=#{loc.coords.accuracy}" +
      "&lat=#{loc.coords.latitude}" +
      "&long=#{loc.coords.longitude}"

    console.log(url)
    response = HTTP.get(url,
      {npmRequestOptions: { oauth: twitterOauth() } });

    if response.statusCode == 200 && response.data
      place = _.find response.data.result.places, (place) ->
        place.place_type == 'neighborhood'


    place && place.full_name