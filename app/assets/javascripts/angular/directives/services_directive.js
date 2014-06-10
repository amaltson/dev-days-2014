/* global swift */
'use strict';

swift.directive('serviceHeader', function(){

	return{
		restrict:'E',
		scope:{
			service:'='
		},
		templateUrl:'/views/service-header-partial.html'
	}
});