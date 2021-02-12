# !/bin/bash
# WARNING - This command will drop the schemas defined in pom.xml.
# Do NOT use in the production environment.
mvn process-resources liquibase:dropAll
