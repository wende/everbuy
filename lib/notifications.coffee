#Push.debug = true


@Notifications = {

  send: (userId, title, text) ->
    Push.send {
      from: 'Chris',
      title: title,
      text: text,
      query: {
      # Ex. send to a specific user if using accounts:
        userId: userId
    } # Query the appCollection
    # token: appId or token eg. "{ apn: token }"
    # tokens: array of appId's or tokens
    # payload: user data
    };
  sendAll : (title, text) ->
    Push.send {
      from: 'Chris',
      title: title,
      text: text,
      query: {}
    }
}