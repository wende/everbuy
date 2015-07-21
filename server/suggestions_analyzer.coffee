@SuggestionsAnalyzer = {
  rules : {
    tooMuch : (a) -> a.length >= 3

  }
  analyzeResult : (results) ->
    if        @rules.tooMuch results.result then "too_much"
    else      "found"
}