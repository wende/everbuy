URL = 'https://webapi.allegro.pl/service.php?wsdl';
WEBAPI_KEY = "9f84d64f"


searchArgs = (query) ->
  webapiKey: WEBAPI_KEY
  countryId: 1
  filterOptions: [
    { item : [
      { filterId: "search", filterValueId: {item : query}}

    ]}
  ]
  resultSize: 5

searchItem = (query) ->
  try
    client = Soap.createClient(URL);
    result = client.doGetItemsList(searchArgs(query))
    (result.itemsList?.item || []).map (item) ->
      item.link = getLink(item.itemId)
      {
        itemId: item.itemId
        itemTitle: item.itemTitle
        price: parseFloat(item.priceInfo?.item?[0].priceValue)
        link: getLink(item.itemId)
        photoUrl : item.photosInfo?.item?[0].photoUrl
        timeToEnd : item.timeToEnd
      }
  catch err
    if err.error == 'soap-creation'
      console.log('SOAP Client creation failed');
    else if err.error == 'soap-method'
      console.log "SOAP Method call failed"
      console.warn err
    else throw err
getLink = (id) ->
  "http://allegro.pl/show_item.php?item=" + id

@Allegro = {
  searchItem
  getLink
}


