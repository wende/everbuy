ServiceConfiguration.configurations.remove({
  service: 'facebook'
});

if(process.env.NODE_ENV == "production") {
  ServiceConfiguration.configurations.insert({
    service: 'facebook',
    appId: '974035889284126',
    secret: '7b3a9f9b480dd34253dc1c3192687f8f'
  });
} else {
  ServiceConfiguration.configurations.insert({
    service: 'facebook',
    appId: '974038949283820',
    secret: '56ceda2e8dfe7e97f95aa2ba05572f06'
  });
 }


