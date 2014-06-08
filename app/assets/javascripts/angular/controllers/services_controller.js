'use strict';

var swift = angular.module('swift', []);

swift.controller('ServiceCtrl', function() {
  this.hello = function() {
    return 'Hello, world!';
  };
});
