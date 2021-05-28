start docker-compose
docker-compose up

access docker mysql, where [hospital_app_default] is the [network] 
docker run -it --network hospital_app_default --rm mysql:8.0 mysql -hmysql_1 -uroot -p

create a sql dump file of all databases
docker exec  hospital_app_mysql_1_1 sh -c 'exec mysqldump --all-databases -uroot -p"[password]"' > [path]/all-databases.sql
