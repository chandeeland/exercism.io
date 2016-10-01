
var Bob = function() {

  this.hey = function(input) {
    var up = input.toUpperCase();
    if (input.replace(/^\s+|\s+$/g, '') == '') { return 'Fine. Be that way!'}
    if (up == input && up != input.toLowerCase()) {
      return 'Whoa, chill out!'
    }
    if (input[input.length - 1] == '?') { return 'Sure.' }
    return 'Whatever.';
  }

};

module.exports = Bob;
