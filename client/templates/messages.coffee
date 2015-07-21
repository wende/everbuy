MSG_LIMIT = "msgLimit"
CURRENCY = "PLN"
limit = 10
Session.setDefault(MSG_LIMIT, 10)

Template.messages.helpers({
  queries : ->
    Meteor.user()?.searches?.queries || []
  tooMuchQueries : ->
    Meteor.user()?.searches?.queries.length >= 5
  price : (doc) ->
    bottom = doc.priceBottom || "0"
    top = doc.priceTop || "∞"

    "#{bottom} - #{top} #{CURRENCY}"
  loggedIn : ->
    Meteor.user()
  ,
  formatDate : (date) ->
    moment(date).format('MM-DD-YYYY')
});

Template.registerHelper('formatDate', (date) ->
   moment(date).format('MM-DD-YYYY HH:mm:SS');
);

Template.messages.events({
  "click #add-new" : () ->
    Overlay.open("queryOverlay")
  "click .delete" : () ->
    console.log("delete")
    console.log(this)
    Meteor.call("removeQuery", this.title)
});
