@Stats = {
  countNested : (arr, query) ->
    arr.reduce (a, b) ->
      cake = query.split "."
      while(nest = cake.shift())
        b = b[nest]
      #Filter removes falsy objects
      a + b.filter((x) -> x).length
    , 0

}