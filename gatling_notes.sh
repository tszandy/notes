mvn archetype:generate


Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): 2029: gatling
Choose a number: 42:
Define value for property 'groupId': com.gatling.tests
Define value for property 'artifactId': GatlingProject
Define value for property 'version' 1.0-SNAPSHOT: :
Define value for property 'package' com.gatling.tests: :



mvn gatling:recorder

mvn gatling:test

mvn clean gatling:help
mvn clean gatling:verify
mvn clean gatling:recorder
mvn clean gatling:test


mvn gatling:test -Dgatling.runMultipleSimulations=true
mvn gatling:test -Dgatling.simulationClass=${simulation_path}

