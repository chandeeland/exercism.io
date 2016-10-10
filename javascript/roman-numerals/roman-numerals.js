var romanize = function(dec, BASES) {
  var BASES = {
    1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I'
  };

  var KEYS = Object.keys(BASES).sort(function(a,b) { return b - a; });

  var roman = [];

  for (var i = 0; i < KEYS.length; i++) {
    key = KEYS[i];
    while (key <= dec) {
      roman.push(BASES[key]);
      dec -= key;
    }
  }
  return roman.join('');
};

module.exports = romanize;
