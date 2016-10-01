var FoodChain = function() {

  var CHAIN = {
    '': '',
    'fly': "I don't know why she swallowed the fly.",
    'spider': "It wriggled and jiggled and tickled inside her.",
    'bird': "How absurd to swallow a bird!",
    'cat': "Imagine that, to swallow a cat!",
    'dog': "What a hog, to swallow a dog!",
    'goat': "Just opened her throat and swallowed a goat!",
    'cow': "I don't know how she swallowed a cow!",
    'horse': "She's dead, of course!"
  };

  var chain = function(i) {
    var animal = Object.keys(CHAIN)[i];
    if (i < 2) return '';
    return "She swallowed the " + animal +
      " to catch the " + fly(i-1) + ".\n" +
      chain(i-1);
  };

  var fly = function(i) {
    var animal = Object.keys(CHAIN)[i];
    if (i == 2) animal += ' ' + CHAIN[animal].replace(/It/,'that').replace(/\./,'');
    return animal
  };

  this.verse = function(i) {
    var animal = Object.keys(CHAIN)[i];
    var out = [];
    out.push("I know an old lady who swallowed a " + animal + ".\n");
    if (i > 1) out.push(CHAIN[animal] + "\n");
    if (i < 8) {
      out.push(chain(i));
      out.push(CHAIN['fly'] + " Perhaps she'll die.\n");
    }
    return out.join('')
  };

  this.verses = function(start, stop) {
    var out = [];
    for (var i = start; i <= stop; i++) {
      out .push(this.verse(i));
    }
    return out.join("\n") + "\n";
  };

};

module.exports = FoodChain;
