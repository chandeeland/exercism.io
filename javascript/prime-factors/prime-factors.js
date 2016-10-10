var primeFactors = function(num) {
  var curr = 2;
  var factors = [];
  while (num > 1) {
    if (num % curr == 0) {
      num = (num / curr);
      factors.push(curr);
    } else {
      curr += 1;
    }
  }
  return factors;
};

module.exports = { for: primeFactors };
