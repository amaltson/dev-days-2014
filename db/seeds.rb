# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Helper to create CV instances
def create_instance(version, version_of_artifact, direct_url, mediation_url)
  cv_instance = Instance.new(name: "Commuted Value Service #{version}",
  version_of_artifact: version_of_artifact)
  cv_instance.endpoints << Endpoint.create(
    name: "commutedValueService#{version}",
    description: "Direct endpoint to version #{version}",
    endpoint_type: 'Direct',
    url: direct_url)
  cv_instance.endpoints << Endpoint.create(
    name: "Development.WESB.commutedValueService#{version}",
    description: "WESB mediation to version #{version}",
    endpoint_type: 'WESB mediation',
    url: mediation_url)
  cv_instance
end

# Create the CV web service
cv_service = Service.new(name: 'Commuted Value Web Service',
  group: 'Core Service',
  jira: 'http://jira',
  confluence: 'http://confluence/display/SYS/Commuted+Value+Web-Service')

cv_service.instances << create_instance('4',
  '4.0.0 [2013-11-05 18:26:00 EST]',
  'http://ihswasdev/CommutedValueWS400/CommutedValueService',
  'http://indy:8889/gateway2MediationWeb/sca/gateway2Export_WS_SOAP11/cvws4')

cv_service.instances << create_instance('5',
  '5.0.0 [2014-02-26 12:26:09 EST]',
  'http://ihswasdev/CommutedValueWS500/CommutedValueService',
  'http://indy:8889/gateway2MediationWeb/sca/gateway2Export_WS_SOAP11/cvws5')

cv_service.instances << create_instance('6',
  '6.0.0 [2014-04-25 11:47:39 EDT',
  'http://ihswasdev/CommutedValueWS600/CommutedValueService',
  'http://indy:8889/gateway2MediationWeb/sca/gateway2Export_WS_SOAP11/cvws6')

# Save all the Instances created
cv_service.instances.each { |instance| instance.save }

# Save the CV service
cv_service.save

