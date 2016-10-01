var usedNames = {};

Array.prototype.sample = function(size) {
  var sample = [];
  for (var i = 0; i < size; i++) {
    sample.push(this[Math.floor(Math.random() * this.length)]);
  }
  return sample;
}

var Robot = function() {

  var LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  var DIGITS = '0123456789'.split('');

  var make_name = function() {
    do {
      var newName =  LETTERS.sample(2).join('') + DIGITS.sample(3).join('');
    } while(usedNames[newName] != undefined)
    usedNames[newName] = true;
    return newName;
  };

  this.name = '';

  this.reset = function() {
    var oldName = this.name;
    this.name = make_name();
    // usedNames[oldName] = undefined;
  }

  this.reset();
};

module.exports = Robot;
