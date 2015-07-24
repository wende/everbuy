

AutoForm.hooks {
  newQuery: {
    before : {
      'update-pushArray' : (doc) ->
        doc.userId = Meteor.userId()
        this.result(doc)
    }
    onSuccess : (args...)->
      console.log(args)
      Router.go("home")
      Overlay.close()

    onError : (args...) ->
      console.log(args)
  }
}
