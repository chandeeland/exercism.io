var Words = function() {

  var cleanMsg = function(msg) {
    return msg.toLowerCase()
    .replace(/[ \t\r\n]+/g, ' ')
    .replace(/^ /g, '')
    .replace(/ $/g, '')
  }

  this.count = function(msg) {
    return cleanMsg(msg).split(' ').reduce(function(accum, word) {
      if (!(word in accum) || isNaN(accum[word])) { accum[word] = 0 }
      accum[word]++;
      return accum;
    }, {})
  };
};

module.exports = Words;
