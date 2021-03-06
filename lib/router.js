var feedSubscription;

// Handle for launch screen possibly dismissed from app-body.js
dataReadyHold = null;

// Global subscriptions
if (Meteor.isClient) {
  Meteor.subscribe('news');
  Meteor.subscribe('bookmarkCounts');
  feedSubscription = Meteor.subscribe('feed');
}


Router.configure({
  layoutTemplate: 'appBody',
  notFoundTemplate: 'notFound'
});

if (Meteor.isClient) {
  // Keep showing the launch screen on mobile devices until we have loaded
  // the app's data
  dataReadyHold = LaunchScreen.hold();

}

HomeController = RouteController.extend({
  onBeforeAction: function() {
    Meteor.subscribe('latestActivity', function() {
      dataReadyHold.release();
    });
  }
});

FeedController = RouteController.extend({
  onBeforeAction: function() {
    this.feedSubscription = feedSubscription;
  }
});

RecipesController = RouteController.extend({
  data: function() {
    return _.values(RecipesData);
  }
});

MessagesController = RouteController.extend({
		onBeforeAction: function() {
				if(!Meteor.user()){
						Overlay.open("authOverlay")
				}
				else {
						if(this.params.overlay){
								Overlay.open("queryOverlay");
						}
				}
  }
});

RecipeController = RouteController.extend({
  onBeforeAction: function() {
    Meteor.subscribe('recipe', this.params.name);
  },
  data: function() {
    return RecipesData[this.params.name];
  }
});

AdminController = RouteController.extend({
  onBeforeAction: function() {
    Meteor.subscribe('news');
  }
});

Router.map(function() {
  this.route('home', {path: '/'});
  this.route('feed');
  this.route('recipes');
  this.route('map');
  this.route('messages');
  this.route('about');
  this.route('recipe', {path: '/recipes/:name'});
  this.route('admin', { layoutTemplate: null });
});

Router.onBeforeAction('dataNotFound', {only: 'recipe'});
Router.onBeforeAction(function() {
  GoogleMaps.load();

}, { only: 'map' });

Router.onBeforeAction(function(){
		/*if(!Meteor.user()){											
    overlay.open('authOverlay');
  }*/
  var path = IronLocation.get().path
  if(path)GAnalytics.pageview(path);

});
