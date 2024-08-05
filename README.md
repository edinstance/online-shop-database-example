# Online Store Example

This project is for me to practice and expand my database knowledge. Currently it is composed of a psql database and uses liquibase for change management.

## How to Run

This project can be ran in two ways, either locally or using docker. 

### Locally

- First create a PostgreSQL database and insure liquibase is installed.
- Then set the enviroment variables in the [.env](.env) file, and example of what is needed is in the [.env.example](.env.example) file.
- Finally run this liquibase command to update the database 
```
liquibase --url=jdbc:postgresql://localhost:5432/${POSTGRES_DB} --username=${POSTGRES_USER} --password=${POSTGRES_PASSWORD} --changelog-file=/changelogs/changelog-master.xml update
```


### Docker 

To run the project using docker you need to: 

- Set the enviroment variables in the [.env](.env) file, and example of what is needed is in the [.env.example](.env.example) file.
- Then run this docker command
```
docker-compose up -d
```


## Snapshots 

There is an example snapshot in the [snapshots](./snapshots/) directory and to create a json snapshot you can use this command.
```
liquibase snapshot --url=jdbc:postgresql://localhost:5432/${POSTGRES_DB} --snapshot-format=json --output-file=snapshots/snapshot.json
```
