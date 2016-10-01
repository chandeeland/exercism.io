var Isogram = function(msg) {
  this.isIsogram = function() {
    clean = msg.toLowerCase().replace(/[ -]/g, '').split('')
    for (var i = 0; i < clean.length; i++) {
      if (i != clean.indexOf(clean[i])) return false;
    }
    return true;
  };
};

module.exports = Isogram;
