var Hamming = function() {
  this.compute = function(a, b) {
    if (a.length != b.length) { throw 'DNA strands must be of equal length.' }

    var difference = 0
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) { difference++; }
    }
    return difference
  }
};

module.exports = Hamming;
