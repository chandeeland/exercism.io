var SpaceAge = function(seconds) {
  this.seconds = seconds;

  var planetYear = function(planet_delta) {
    var earth = seconds / 31557600.0;
    var planet = earth / planet_delta;
    return Math.round( planet * 100 ) / 100.0;
  };

  this.onEarth = function() {
    return planetYear(1);
  };

  this.onMercury = function() {
    return planetYear(0.2408467);
  };

  this.onVenus = function() {
    return planetYear(0.61519726);
  };

  this.onMars = function() {
    return planetYear(1.8808158)
  };

  this.onJupiter = function() {
    return planetYear(11.862615);
  };

  this.onSaturn = function() {
    return planetYear(29.447498);
  };

  this.onUranus = function() {
    return planetYear(84.016846);
  };

  this.onNeptune = function() {
    return planetYear(164.79132);
  };
}

module.exports = SpaceAge;
