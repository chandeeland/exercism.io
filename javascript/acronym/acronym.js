var Acronyms = function() {}

Acronyms.parse = function(msg) {
  return msg
    .replace(/[a-z0-9]+([A-Z])/g, " $1")
    .split(/[- ]/)
    .map(function(word) {
      return word[0].toUpperCase();
    })
    .join('');

};

module.exports = Acronyms;
