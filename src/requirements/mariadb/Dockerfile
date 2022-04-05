FROM debian:buster

# Create working directory
RUN mkdir -p /mariaDB
WORKDIR /mariaDB

# Install necessary tools
RUN apt-get update && apt-get install -y \
vim mariadb-server procps gettext-base 

# # mysql
# COPY conf/script.sql /mariaDB/script.sql
# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN service mysql start && mysql -u root < /mariaDB/script.sql

COPY tools/script.sql.template /mariaDB/script.sql.template 
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY --chmod=0755 tools/entrypoint.sh . 

# RUN mysql_install_db
# ENTRYPOINT [ "mysqld" ]
#  ENTRYPOINT [ "mysqld_safe" ]

ENTRYPOINT [ "/mariaDB/entrypoint.sh" ] 
