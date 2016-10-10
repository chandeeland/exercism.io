var Clock = function(h, m) {

  var calcTime = function(h,m) {
    this.hours = (((h + Math.floor(m / 60)) % 24) + 24) % 24;
    this.minutes = ((m % 60) + 60) % 60;
  };

  this.equals = function(other) {
    return other.hours == this.hours && other.minutes == this.minutes;
  };

  this.minus = function(m) {
    calcTime.apply(this,[this.hours, this.minutes - m]);
    return this;
  };

  this.plus = function(m) {
    calcTime.apply(this,[this.hours, this.minutes + m]);
    return this;
  };

  this.toString = function() {
    return [
      ('00' + this.hours).slice(-2),
      ('00' + this.minutes).slice(-2)
    ].join(':');
  };

  calcTime.apply(this, [h,m])
};

Clock.at = function(hours, minutes) {
  return new Clock(hours, minutes || 0);
};

module.exports = Clock;
