# !/bin/bash
export FFFS_WEB_PORTAL_STAGING_DB_ADMIN_USERNAME='#{webPortalStagingDbAdminUsername}'
export FFFS_WEB_PORTAL_STAGING_DB_ADMIN_PASSWORD='#{webPortalStagingDbAdminPassword}'
export FFFS_WEB_PORTAL_STAGING_DB_CONNECTION_STRING='#{webPortalStagingDbConnectionString}'
export FFFS_WEB_PORTAL_STAGING_DB_USERNAME='#{webPortalStagingDbUsername}'
export FFFS_WEB_PORTAL_STAGING_DB_PASSWORD='#{webPortalStagingDbPassword}'
export FFFS_WEB_PORTAL_STAGING_DB_REPORTING_USERNAME='#{webPortalStagingDbReportingUsername}'
export FFFS_WEB_PORTAL_STAGING_DB_REPORTING_PASSWORD='#{webPortalStagingDbReportingPassword}'


# WARNING - This command will drop the schemas defined in pom.xml.
# Do NOT use in the production environment.
echo "Executing Maven DB script"
mvn liquibase:dropAll
