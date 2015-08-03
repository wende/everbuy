URL = 'https://webapi.allegro.pl/service.php?wsdl';
WEBAPI_KEY = "9f84d64f"

soap = null;

Meteor.startup ->
  soap = Soap.createClient(URL);

is_empty = (o)->!Object.keys(o).length
searchArgs = (query, resultSize = 5) ->
  price = {}
  price.rangeValueMin = query.priceBottom if query.priceBottom
  price.rangeValueMax = query.priceTop if query.priceTop
    
  webapiKey: WEBAPI_KEY
  countryId: 1
  filterOptions:
    { item : 
      [ { filterId: "search", filterValueId: {item : query.title}},
        unless is_empty(price) then { filterId: "price", filterValueRange: price}
      ]
    }
  resultSize: resultSize

searchItem = (query) ->
  try
    sa = searchArgs(query)
    console.log sa
    result = soap.doGetItemsList(sa)
    console.log result
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
      console.log('SOAP Soap creation failed');
    else if err.error == 'soap-method'
      console.log "SOAP Method call failed"
      console.warn err
      console.warn(soap.lastRequest)
    else
      
      throw err

getItemsCount = (query) ->
  try
    result = soap.doGetItemsList(searchArgs(query, 0))
    result.itemsCount
  catch err
    if err.error == 'soap-creation'
      console.log('SOAP client creation failed');
    else if err.error == 'soap-method'
      console.log "SOAP Method call failed"
      console.warn err
    else throw err
  

getLink = (id) ->
  "http://allegro.pl/show_item.php?item=" + id


@Allegro = {
  searchItem
  getLink
  getItemsCount
}

