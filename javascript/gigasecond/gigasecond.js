var Gigasecond = function(dob) {
  this.date = function() {
    return new Date(dob.getTime() + Math.pow(10, 12));
  };
};

module.exports = Gigasecond;
