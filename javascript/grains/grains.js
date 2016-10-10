var BigInt = require('./big-integer.js')

var Grains = function() {
  this.square = function(i) {
    return BigInt(2).pow(i - 1).toString();
  };
  this.total = function() {
    return BigInt(2).pow(64).toString();
  };
};

module.exports = Grains;
