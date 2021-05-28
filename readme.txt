Create dumb folder, or comment out the copy command from dockerfile of mysql container.
This is needed if we want to start our database with an init.sql script.
database/dumbs/

start docker-compose
docker-compose up

access docker mysql, where [hospital_app_default] is the [network] 
docker run -it --network hospital_app_default --rm mysql:8.0 mysql -hmysql_1 -uroot -p

create a sql dump file of all databases.
docker exec  [container-name] sh -c 'exec mysqldump --all-databases -uroot -p"[password]"' > [path]/all-databases.sql
