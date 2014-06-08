# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create the CV web service
Service.create!(name: 'Commuted Value Web Service',
  group: 'Core Service',
  jira: 'http://jira',
  confluence: 'http://confluence/display/SYS/Commuted+Value+Web-Service')
