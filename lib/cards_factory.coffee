@CardFactory = {
  startedLooking : (query, userId) ->
    {
      conclusion: "started_looking"
      query: query
      userId: userId
      suggestion:
        title: query.title
        link: "#"
        photoUrl: "/img/activity/activity-placeholder-strawberry-640x640.jpg"

    }
}