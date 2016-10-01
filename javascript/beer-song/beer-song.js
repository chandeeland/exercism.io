var BeerSong = function () {

  var bottleCount = function(num) {
    if (num == 0) {return 'No more';}
    if (num < 0){ return "99".toString();}
    return num.toString();
  };

  var action = function(num) {
    if (num == 0) return "Go to the store and buy some more, "
    return "Take " + (num == 1 ? 'it' : 'one') + " down and pass it around, ";
  };

  var bottle = function(num) {
    return num == 1 ? 'bottle' : 'bottles';
  }

  this.verse = function(num) {
    return bottleCount(num) +  " " + bottle(num) + " of beer on the wall, " +
    bottleCount(num).toLowerCase() +  " " + bottle(num) + " of beer.\n" +
    action(num) +
    bottleCount(num - 1).toLowerCase() + " " + bottle(num-1) + " of beer on the wall.\n";
  }

  this.sing = function(start, stop) {
    var song = [];
    if (stop === undefined) stop = 0;
    for (var i = start; i >= stop; i--) {
      song.push(this.verse(i));
    }
    return song.join("\n");
  }
};

module.exports = BeerSong;
