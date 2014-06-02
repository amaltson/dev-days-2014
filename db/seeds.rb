# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Helper to create CV instances
def create_instance(version:, version_of_artifact:, direct_url:, mediation_url:)
  cv_instance = Instance.new(name: "Commuted Value Service #{version}",
  version_of_artifact: version_of_artifact)
  cv_instance.endpoint << Endpoint.create(
    name: "commutedValueService#{version}",
    description: "Direct endpoint to version #{version}",
    endpoint_type: 'Direct',
    url: direct_url)
  cv_instance.endpoint << Endpoint.create(
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

cv_service.repository << Repository.create(
  url: 'http://src/benefits/com.otpp.domain.commutedvalue')
cv_service.repository << Repository.create(
  url: 'http://src/benefits/com.otpp.ws.commutedValue')
cv_service.repository << Repository.create(
  url: 'http://src/benefits/benefit-dev-props')
cv_service.repository << Repository.create(
  url: 'http://src/middleware/commutedvalue-prod-properties')

cv_service.deployment << Deployment.create(name: 'wasdev1-snapshot',
  url: 'http://bamboo:8085/deploy/viewEnvironment.action?id=26640388')

cv_service.instance << create_instance(version: '4',
  version_of_artifact: '4.0.0 [2013-11-05 18:26:00 EST]',
  direct_url: 'http://ihswasdev/CommutedValueWS400/CommutedValueService',
  mediation_url: 'http://indy:8889/gateway2MediationWeb/sca/gateway2Export_WS_SOAP11/cvws4')

cv_service.instance << create_instance(version: '5',
  version_of_artifact: '5.0.0 [2014-02-26 12:26:09 EST]',
  direct_url: 'http://ihswasdev/CommutedValueWS500/CommutedValueService',
  mediation_url: 'http://indy:8889/gateway2MediationWeb/sca/gateway2Export_WS_SOAP11/cvws5')

cv_service.instance << create_instance(version: '6',
  version_of_artifact: '6.0.0 [2014-04-25 11:47:39 EDT',
  direct_url: 'http://ihswasdev/CommutedValueWS600/CommutedValueService',
  mediation_url: 'http://indy:8889/gateway2MediationWeb/sca/gateway2Export_WS_SOAP11/cvws6')

# Save all the Instances created
cv_service.instance.each { |instance| instance.save }

cv_service.save
