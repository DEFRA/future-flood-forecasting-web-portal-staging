# Future Flood Forecasting Web Portal Staging Database

Version control for the staging database of the Future Flood Forecasting Web Portal.
The staging database holds data extracted from the core forecasting engine prior to transformation for reporting and visualisation purposes.

## Reporting and visualisation concerns

The staging database includes a reporting schema for data transformation activites.

## Prerequisites

### Mandatory

* Java 8 or above
* Maven 3.x
* Either of the following:
  * Azure SQL database instance (for cloud deployment)
  * Microsoft SQL Server Docker container (for local deployment)

### Optional

If using Docker

* Docker 18.09 CE or later
* Docker Compose 1.24 or later

## Common environment variables

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_ADMIN_USERNAME      | Username for database version control account         | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_ADMIN_PASSWORD      | Password for database version control account         | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_CONNECTION_STRING   | Database JDBC connection string                       | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_STAGING_SCHEMA      | Staging schema name                                   | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_USERNAME            | The user that owns the staging schema                 | yes      |         |
| FFFS_WEB_PORTAL_STAGING_DB_REPORTING_SCHEMA    | Schema for reporting data transformation activities   | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_REPORTING_USERNAME  | The reporting schema user                             | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_REPORTING_PASSWORD  | Password for the reporting schema user                | yes      |         |             |

## Docker specific enviroment variables

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_CONTAINER_PORT      | Container port for the database                       | no       | 1433    |             |
| FFFS_WEB_PORTAL_STAGING_DB_HOST_PORT           | Host port for the database                            | no       | 1433    |             |
| SA_PASSWORD                                    | System administrator password                         | yes      |         |             |

## Azure SQL based incremental build

* Ensure the required environment variables are set.
* Run ./bootstrap.sh from the directory containing this file. This script runs Liquibase changesets on an incremental basis.

## Azure SQL based clean build (NON-PRODUCTION USE ONLY)

* Ensure the required environment variables are set.
* Run ./tear-down.sh from the directory containing this file. FFFS_WEB_PORTAL_STAGING_DB_STAGING_SCHEMA and FFFS_WEB_PORTAL_STAGING_DB_REPORTING_SCHEMA
  will be **dropped** allowing a fresh run of all Liquibase changesets.
* Run ./bootstrap.sh from the directory containing this file. All Liquibase changesets will be run.
  
## Local Linux Host Based Docker Build

* Ensure the required environment variables are set.
* Run ./local-bootstrap.sh from  the directory containing this file. This creates a SQL Server 2017 instance containing a database called
  **fffswebportalstaging** running in a Docker container. Volumes are not used at present. All Liquibase changesets will be run.

## Contributing to this project

If you have an idea you'd like to contribute please log an issue.

All contributions should be submitted via a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

[http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3)

The following attribution statement MUST be cited in your products and applications when using this information.
