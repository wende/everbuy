/**
 * Created by iraasta on 09.07.15.
 */
Template.menu.helpers({
  menuitems: function(){ return Session.get("config")}
});
Template.menuitem.helpers({
		text: function(){
				console.log(this.display);
				return i18n(this.display);
				}
});
/*

</a>
<a href="{{pathFor 'bookmarks'}}" class="{{activePage 'bookmarks'}}">
<span class="wrapper-menu-item">
<span class="icon-bookmark-hollow"></span>
<span class="title-menu">Bookmarks</span>
</span>
</a>
<a href="{{pathFor 'about'}}" class="{{activePage 'about'}}">
<span class="wrapper-menu-item">
<span class="icon-question"></span>
<span class="title-menu">About</span>
</span>
</a>-->*/
