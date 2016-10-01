var PhoneNumber = function(phone) {
  var clean = function() {
    var scrub = phone.replace(/[^\d]/g, '');
    if (scrub.length == 11 ) { scrub = scrub.replace(/^1/,'') }
    if (scrub.length == 10) return scrub;
    return '0000000000';
  }();

  var parts = clean.match(/^(.{3})(.{3})(.{4})$/);

  this.number = function() {
    return clean;
  };

  this.areaCode = function() {
    return parts[1];
  };

  this.toString = function() {
    return '(' + parts[1] + ') ' + parts[2] + '-' + parts[3];
  };
};

module.exports = PhoneNumber;
