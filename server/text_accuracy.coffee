
sliding = `function(array, window) {
  var end, i, _i, _results;
  end = array.length - window;
  _results = [];
  for (i = _i = 0; 0 <= end ? _i <= end : _i >= end; i = 0 <= end ? ++_i : --_i) {
    _results.push(array.slice(i, (i + window - 1) + 1 || 9e9));
  }
  return _results;
}`


compare = (a, b) ->
  a_cake = sliding(a,3)
  b_cake = sliding(b,3)
  100 * _.difference(a_cake, b_cake).length / a_cake.length


@TextAccuracy = {compare}
