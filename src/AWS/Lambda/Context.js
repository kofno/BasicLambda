"use strict";

// module AWS.Lambda.Context

exports.succeed = function(context) {
  return function(message) {
    return function() {
      context.succeed(message);
    };
  };
};

exports.fail = function(context) {
  return function(message) {
    return function() {
      context.fail(message);
    };
  };
};
