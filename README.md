# Future Flood Forecasting Web Portal Staging Database

Version control for the staging database of the Future Flood Forecasting Web Portal.
The staging database holds data extracted from the core forecasting engine prior to transformation for reporting and visualisation purposes.

## Temporary reporting and visualisation concerns

Reporting and visualisation concerns will be handled by distinct data storage in due course. Until this time the staging database includes
a temporary schema to provide basic support for these concerns.

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
| FFFS_WEB_PORTAL_STAGING_DB_USERNAME            | The user that owns the staging schema                 | yes      |         |             |

## Docker specific enviroment variables

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_CONTAINER_PORT      | Container port for the database                       | no       | 1433    |             |
| FFFS_WEB_PORTAL_STAGING_DB_HOST_PORT           | Host port for the database                            | no       | 1433    |             |
| SA_PASSWORD                                    | System administrator password                         | yes      |         |             |

## Temporary enviroment variables

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| FFFS_WEB_PORTAL_STAGING_DB_REPORTING_SCHEMA    | Temporary schema for reporting/visualisation purposes | yes      |         |             |

## Azure SQL based build

* Ensure the required environment variables are set.
* Run ./bootstrap.sh from the directory containing this file. This adds a database called **fffswebportalstaging** to an existing Azure SQL
  instance. The staging schema will contain a table called TIMESERIES.
  
## Local Linux Host Based Docker Build

* Ensure the required environment variables are set.
* Run ./local-bootstrap.sh from  the directory containing this file. This creates a SQL Server 2017 instance containing a database called
  **fffswebportalstaging** running in a Docker container. Volumes are not used at present. The staging schema will contain a table called
  TIMESERIES.

## Contributing to this project

If you have an idea you'd like to contribute please log an issue.

All contributions should be submitted via a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

[http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3)

The following attribution statement MUST be cited in your products and applications when using this information.
