App.info({
  id: "pl.neontree.iraasta.everbuy",
  name: 'Everbuy',
  description: 'Hunt for rare stuff on Allegro, Ebay and Amazon',
  author: 'Neon Tree Solutions Ltd',
  email: 'contact@neontree.pl',
  website: 'http://everbuy.pl',
  version: '0.1.0'
});

App.icons({
  // iOS
  'iphone': 'resources/icons/cordova_ios_144.png',
  'iphone_2x': 'resources/icons/cordova_ios_144.png',
  'ipad': 'resources/icons/cordova_512.png',
  'ipad_2x': 'resources/icons/cordova_ios_144.png',

  // Android
  'android_ldpi': 'resources/icons/cordova_android_96.png',
  'android_mdpi': 'resources/icons/cordova_android_96.png',
  'android_hdpi': 'resources/icons/cordova_android_96.png',
  'android_xhdpi': 'resources/icons/cordova_android_96.png'
});

App.launchScreens({
  // iOS
  'iphone': 'resources/splash/splash-320x480.png',
  'iphone_2x': 'resources/splash/splash-320x480@2x.png',
  'iphone5': 'resources/splash/splash-320x568@2x.png',
  'ipad_portrait': 'resources/splash/splash-768x1024.png',
  'ipad_portrait_2x': 'resources/splash/splash-768x1024@2x.png',
  'ipad_landscape': 'resources/splash/splash-1024x768.png',
  'ipad_landscape_2x': 'resources/splash/splash-1024x768@2x.png',

  // Android
  'android_ldpi_portrait': 'resources/splash/splash-200x320.png',
  'android_ldpi_landscape': 'resources/splash/splash-320x200.png',
  'android_mdpi_portrait': 'resources/splash/splash-320x480.png',
  'android_mdpi_landscape': 'resources/splash/splash-480x320.png',
  'android_hdpi_portrait': 'resources/splash/splash-480x800.png',
  'android_hdpi_landscape': 'resources/splash/splash-800x480.png',
  'android_xhdpi_portrait': 'resources/splash/splash-720x1280.png',
  'android_xhdpi_landscape': 'resources/splash/splash-1280x720.png'
});

App.setPreference('StatusBarOverlaysWebView', 'false');
App.setPreference('StatusBarBackgroundColor', '#000000');
App.setPreference('Orientation', 'portrait');

App.accessRule('*');
