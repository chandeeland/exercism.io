var Year = function(year) {
  this.year = year

  this.isLeap = function () {
    if (this.year % 400 == 0) return true;
    if (this.year % 100 == 0) return false;
    if (this.year % 4 == 0) return true;
    return false;
  };
};


module.exports = Year;
