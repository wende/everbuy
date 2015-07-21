

AutoForm.hooks {
  newQuery: {
    before : {
      'update-pushArray' : (doc) ->
        doc.userId = Meteor.userId()
        this.result(doc)
    }
    onSuccess : (args...)->
      console.log(args)
      Overlay.close()

    onError : (args...) ->
      console.log(args)
  }
}
