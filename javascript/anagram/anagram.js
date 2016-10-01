var Anagram = function(seed) {

  var cleaner = function(start) {
    return start.toLowerCase().split('').sort().join('');
  };

  var target = cleaner(seed);


  this.matches = function(candidates) {
    if (typeof candidates == 'string') {
      candidates = Array.prototype.slice.call(arguments);
    }
    return candidates.filter(function(candidate) {
      return target == cleaner(candidate) &&
        seed.toLowerCase() != candidate.toLowerCase();
    });
  };
};

module.exports = Anagram;
