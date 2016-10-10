var Binary = function(code) {
  this.toDecimal = function() {
    if (code.match(/[^01]/)) return 0;
    var i = 0;
    return code.split('').reverse().reduce(function(sum, x) {
      i++;
      return sum + (Math.pow(2, (i - 1)) * x);
    }, 0)
  };
};

module.exports = Binary;
