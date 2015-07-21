var FEATURED_COUNT = 4;

Template.home.helpers({
  // selects FEATURED_COUNT number of recipes at random
  featuredRecipes: function() {
    var recipes = _.values(RecipesData);
    var selection = [];
    
    for (var i = 0;i < FEATURED_COUNT;i++)
      selection.push(recipes.splice(_.random(recipes.length - 1), 1)[0]);

    return selection;
  },
  
  activities: function() {
    var user = Meteor.user()
    if(!user || !user.searches || !user.searches.suggestions) return [];
    return user.searches.suggestions.reverse().map(function(item){
      console.log(item)
      if(item.conclusion == "too_much"){
        return {
          activity: item.query.title,
          text: i18n("results.too_much", item.query.title),
          userName: i18n("results.too_much_title"),
          avatar: item.suggestion.photosInfo.item[0].photoUrl,
          path: "/messages"

        }
      } else {
        return {
          activity: item.query.title,
          text: i18n("results." + item.conclusion, item.query.title),
          userName: item.suggestion.itemTitle,
          avatar: item.suggestion.photosInfo.item[0].photoUrl,
          path: item.suggestion.link,
          price: item.price
        }
      }
    });
  },
  welcomeActivity : function(){
    return Activities.welcome();
  },
  
  latestNews: function() {
    return News.latest();
  }
});