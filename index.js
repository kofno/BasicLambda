'use strict';

var lambda = require('./output/BasicLambda');

exports.handler = function(data, context) {
  lambda.handler(context)(data)();
};
