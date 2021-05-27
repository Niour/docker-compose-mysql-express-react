start docker-compose
docker-compose up

access docker mysql, where [hospital_app_default] is the [network] 
docker run -it --network hospital_app_default --rm mysql:8.0 mysql -hmysql_1 -uroot -p


docker exec --network hospital_app_default mysql sh -c 'exec mysqldump --all-databases -uroot -p"password"' > /mnt/c/Users/Nikos/Documents/all-databases.sql
