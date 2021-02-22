# Incident Management Forecasting (Known Previously As Future Flood Forecasting) Web Portal Staging Database

[![CI](https://github.com/DEFRA/future-flood-forecasting-web-portal-staging/actions/workflows/ci.yml/badge.svg)](https://github.com/DEFRA/future-flood-forecasting-web-portal-staging/actions/workflows/ci.yml)

Version control for the staging database of the Incident Management Forecasting Web Portal.
The staging database holds data extracted from the [core forecasting engine](https://www.deltares.nl/en/software/flood-forecasting-system-delft-fews-2/) by [Microsoft Azure functions](https://github.com/DEFRA/future-flood-forecasting-web-portal-importer) prior to transformation for reporting and visualisation purposes.

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

## Authentication

**Either** Microsoft Azure Active Directory (AAD) or database username/password authentication is supported.

* Microsoft Azure Active Directory is recommended in a Microsoft Azure environment.
* Database username/password authentication is recommended in a unit test environment.

## Microsoft Azure Active Directory Authentication Related Environment Variables

**These environment variables are only required when Microsoft Azure Active Directory authentication is used.**

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_AAD_USERNAME        | The AAD staging user                                  | yes      |         |             |

## Database Username/Password Authentication Related Environment Variables

**These environment variables are only required when database username/password authentication is used.**

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_ADMIN_USERNAME      | Username for database version control account         | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_ADMIN_PASSWORD      | Password for database version control account         | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_USERNAME            | The staging schema user                               | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_PASSWORD            | Password for the staging schema user                  | yes      |         |             |

## Common environment variables

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_CONNECTION_STRING   | Database JDBC connection string (**see below**)       | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_REPORTING_USERNAME  | The reporting schema user                             | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_REPORTING_PASSWORD  | Password for the reporting schema user                | yes      |         |             |

### The JDBC Connection String And Microsoft Azure Active Directory Authentication

This component can be configured to use numerous Microsoft Azure Active Directory authentication options (see the [SQL Server JDBC driver documentation](https://docs.microsoft.com/en-us/sql/connect/jdbc/setting-the-connection-properties?view=sql-server-ver15)). It is recommended that Microsoft Azure Active Directory authentication settings are placed within the JDBC connection string.

## Docker specific enviroment variables

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_CONTAINER_PORT      | Container port for the database                       | no       | 1433    |             |
| FFFS_WEB_PORTAL_STAGING_DB_HOST_PORT           | Host port for the database                            | no       | 1433    |             |
| SA_PASSWORD                                    | System administrator password                         | yes      |         |             |

## Redundant Legacy Environment Variables

The following environment variables below are no longer used. It is recommended that they should be removed from any existing installation
accordingly.

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_STAGING_SCHEMA      | Staging schema name                                   | yes      |         |             |
| FFFS_WEB_PORTAL_STAGING_DB_REPORTING_SCHEMA    | Schema for reporting data transformation activities   | yes      |         |             |

## Azure SQL based incremental build

* Ensure the required environment variables are set.
* Run ./bootstrap.sh from the directory containing this file. This script runs Liquibase changesets on an incremental basis.

## Azure SQL based clean build (NON-PRODUCTION USE ONLY)

* Ensure the required environment variables are set.
* Run ./tear-down.sh from the directory containing this file. The reporting and staging schemas
  will be **dropped** allowing a fresh run of all associated Liquibase changesets. Note that tear down does
  **not** drop things that cannot be included in a snapshot (such as users and user defined functions). Items
  excluded from tear down **must** be rolled back separately.
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
