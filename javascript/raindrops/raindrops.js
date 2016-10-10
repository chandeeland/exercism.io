module.exports = function() {
  this.convert = function(num) {
    var drops = [];
    if (num % 3 == 0) drops.push('Pling');
    if (num % 5 == 0) drops.push('Plang');
    if (num % 7 == 0) drops.push('Plong');
    if (drops.length > 0) return drops.join('');
    return num.toString();
  }
}
