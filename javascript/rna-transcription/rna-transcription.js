var DnaTranscriber = function () {

  var RNA = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U'
  };

  this.toRna = function (dna) {
    return dna.split('').map(function(x) {return RNA[x] }).join('');
  };

};

module.exports = DnaTranscriber;
