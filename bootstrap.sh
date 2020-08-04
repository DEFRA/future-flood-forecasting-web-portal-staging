# !/bin/bash
mvn clean
# Create the target/test-classes directory expected by Liquibase
mkdir -p target/test-classes
mvn process-resources
