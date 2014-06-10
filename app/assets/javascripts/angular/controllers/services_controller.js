/* global swift */
'use strict';

swift.factory('ServiceFactory', function($http){

	return function(id){
		// return the service with matching id
		return $http.get('/services/'+id);
	};

	return function(){
		// return all services
		return $htpp.get('/services/');
	}
});


swift.controller('ServiceCtrl', function($http,ServiceFactory) {
	var _this = this;
	var current_service_id = 1; // hardcoded to id = 1 for now

  ServiceFactory(current_service_id).success(function(data){
  	_this.serviceData = data;

  	//temp - to improve
  	$http.get('services/' + current_service_id + '/instances/').success(function(data){
  		_this.instancesData = data;
  		_this.endpointsData =[];
  		angular.forEach(_this.instancesData, function(value,key){
  			$http.get('services/'+ current_service_id + '/instances/' + value.id + '/endpoints/').success(function(data){
  				// for each instance, retrieve its list of endpoints
  				_this.endpointsData[key] = data;
  			});
  		});
  	});
  	//temp - end of to improve

  });




});


