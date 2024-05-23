# !/bin/bash
export FFFS_WEB_PORTAL_STAGING_DB_ADMIN_USERNAME='#{webPortalStagingDbAdminUsername}'
export FFFS_WEB_PORTAL_STAGING_DB_ADMIN_PASSWORD='#{webPortalStagingDbAdminPassword}'
export FFFS_WEB_PORTAL_STAGING_DB_CONNECTION_STRING='#{webPortalStagingDbConnectionString}'
export FFFS_WEB_PORTAL_STAGING_DB_USERNAME='#{webPortalStagingDbUsername}'
export FFFS_WEB_PORTAL_STAGING_DB_PASSWORD='#{webPortalStagingDbPassword}'
export FFFS_WEB_PORTAL_STAGING_DB_REPORTING_USERNAME='#{webPortalStagingDbReportingUsername}'
export FFFS_WEB_PORTAL_STAGING_DB_REPORTING_PASSWORD='#{webPortalStagingDbReportingPassword}'


echo "Executing Maven DB script to clear checksums for all Liquibase changesets."
mvn process-resources liquibase:clearCheckSums  "-Pliquibase-without-update"
