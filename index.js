"use strict";

var lambda = require('BasicLambda')

exports.handler = function(data, context) {
  lambda.handler(context)(data)();
};
