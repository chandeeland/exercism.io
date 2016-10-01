var Pangram = function(msg) {
  var ABC = 'abcdefghijklmnopqrstuvwxyz'.split('');

  this.isPangram = function() {
    var clean = msg.toLowerCase().split('').sort()
    for (var i = 0; i < clean.length; i++) {
      if (clean[i] == ABC[0]) { ABC.shift(); }
    }
    return ABC.length == 0;
  }
};

module.exports = Pangram;
