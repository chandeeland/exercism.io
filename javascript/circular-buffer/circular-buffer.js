var circularBuffer = function(max) {
  var buffer = [];

  return {
    clear: function() {
      buffer = [];
    },

    forceWrite: function(value) {
      if (buffer.length >= max) buffer.shift();
      if (value) buffer.push(value);
    },

    read: function() {
      if (buffer.length <= 0) throw bufferEmptyException();
      return buffer.shift();
    },

    write: function(value) {
      if (buffer.length >= max) throw bufferFullException();
      this.forceWrite(value);
    }
  };
};

var bufferEmptyException = function() {
  return {
    name: 'bufferEmptyException',
    message: 'cannot read empty buffer',
    toString: function() { return this.name + ": " + this.message; }
  };
};
bufferEmptyException.prototype = Object.create(Error.prototype);

var bufferFullException = function() {
  return {
    name: 'bufferFullException',
    message: 'cannot write to full buffer',
    toString: function() { return this.name + ": " + this.message; }
  };
};
bufferFullException.prototype = Object.create(Error.prototype);

module.exports = {
  circularBuffer: circularBuffer,
  bufferEmptyException: bufferEmptyException,
  bufferFullException: bufferFullException
};
