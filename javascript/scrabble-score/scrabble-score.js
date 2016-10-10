var Score = function(word) {

  if (word === null) return 0;

  var VALUES = {};
  ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].map(function(x) { VALUES[x] = 1; } );
  ['D', 'G'].map(function(x) { VALUES[x] = 2; });
  ['B', 'C', 'M', 'P'].map(function(x) { VALUES[x] = 3; });
  ['F', 'H', 'V', 'W', 'Y'].map(function(x) { VALUES[x] = 4; });
  ['K'].map(function(x) { VALUES[x] = 5; });
  ['J', 'X'].map(function(x) { VALUES[x] = 8; });
  ['Q', 'Z'].map(function(x) { VALUES[x] = 10; });

  return word.toUpperCase().split('')
    .reduce(function(sum, curr) { return sum + VALUES[curr]}, 0)

}

module.exports = Score;
