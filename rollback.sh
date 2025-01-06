# !/bin/bash
echo "Executing Maven DB script to rollback all Liquibase changesets."
mvn process-resources liquibase:rollback "-Dliquibase.rollbackDate=2020-06-04"  "-Pliquibase-without-update"
