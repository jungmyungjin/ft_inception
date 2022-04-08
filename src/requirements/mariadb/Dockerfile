FROM debian:buster

# Create working directory
RUN mkdir -p /mariaDB
WORKDIR /mariaDB

# Install necessary tools
RUN apt-get update && apt-get install -y \
vim mariadb-server procps gettext-base 

# # mysql
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sql.template /mariaDB/script.sql.template  
COPY tools/entrypoint.sh .	 
RUN chmod 755 tools/entrypoint.sh

# RUN mysql_install_db
ENTRYPOINT [ "/mariaDB/entrypoint.sh" ] 
CMD ["mysqld_safe"]