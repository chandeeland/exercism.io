var Triangle = function(a,b,c) {
  var triangle = [a,b,c].sort(function(i,j) { return i - j; });
  var a = triangle[0];
  var b = triangle[1];
  var c = triangle[2];

  this.kind = function() {
    if (a <= 0) throw 'Triangles must have a size'
    if (a + b <= c) throw 'Violates Triangle inequality'

    if (a == c) { return "equilateral"; }
    if (a == b || b == c) { return 'isosceles'; }
    return 'scalene';
  }
}

module.exports = Triangle
