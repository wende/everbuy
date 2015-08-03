SENDING = "sending_query"
Session.setDefault(SENDING, false)

Template.queryOverlay.helpers({
  askedOnce : -> Session.get(ASKED)
  optional : -> i18n("query.optional")
})


AutoForm.hooks {
  newQuery: {
    before: {
      method : (doc) ->
        #unless doc.title then return this.result(false)
        Session.set(SENDING, Template.appBody.addNotification({title: i18n("query.sending")}))
        this.result(doc);
    }
    onSuccess : (args...)->
      id = Session.get(SENDING)
      Template.appBody.removeNotification(id)
      Router.go("home")
      Overlay.close()

    onError : (number, {reason: count}, r) ->
      id = Session.get(SENDING)
      Template.appBody.removeNotification(id)
      if /validation/.test(number) then return true
      console.log [number, count, r]
      Template.appBody.addNotification({title: i18n("query.too_many", count)})
  }
}
