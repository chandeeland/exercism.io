var ETL = function() {
  this.transform = function(old) {
    var newStyle = {};
    var values = Object.keys(old);
    for (var i = 0; i < values.length; i++) {
      var value = values[i];
      var keys = old[value];
      for(var j = 0; j < keys.length; j++) {
        var key = keys[j].toLowerCase();
        newStyle[key] = parseInt(value);
      }
    }
    return newStyle;
  }
};

module.exports = ETL;
