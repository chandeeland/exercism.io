var School = function() {
  var roster = {};

  this.add = function(student, grade) {
    if (roster[grade] == undefined) roster[grade] = []
    roster[grade].push(student);
  };

  this.grade = function(grade) {
    return (roster[grade] || []).sort();
  };

  this.roster = function() {
    return Object.keys(roster).reduce(function(out,curr) {
      out[curr] = roster[curr].sort();
      return out;
    }, {});
  };
};

module.exports = School;
