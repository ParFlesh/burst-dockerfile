#!/bin/sh

CONF_DIR=./conf

# Rebuild configurations
rm $CONF_DIR/nxt.properties 2> /dev/null
rm $CONF_DIR/logging.properties 2> /dev/null

# My IP
echo "nxt.myAddress = ${PUBLIC_IP}" >> $CONF_DIR/nxt.properties
echo "\n" >> $CONF_DIR/nxt.properties

# Peer network
echo "nxt.peerServerHost = 0.0.0.0" >> $CONF_DIR/nxt.properties
echo "nxt.peerServerPort = 8123" >> $CONF_DIR/nxt.properties
echo "\n" >> $CONF_DIR/nxt.properties

# API network
echo "nxt.enableAPIServer = true" >> $CONF_DIR/nxt.properties
echo "nxt.apiServerHost = 127.0.0.1" >> $CONF_DIR/nxt.properties
echo "nxt.apiServerPort = 8125" >> $CONF_DIR/nxt.properties
echo "\n" >> $CONF_DIR/nxt.properties

# Db configuration (MariaDB)
echo "nxt.dbUrl = jdbc:mariadb://${DB_HOST}:${DB_PORT}/burstwallet" >> $CONF_DIR/nxt.properties
echo "nxt.dbUsername = ${DB_USERNAME}" >> $CONF_DIR/nxt.properties
echo "nxt.dbPassword = ${DB_PASSWORD}" >> $CONF_DIR/nxt.properties
echo "nxt.dbMaximumPoolSize = ${DB_MAX_POOL_SIZE}" >> $CONF_DIR/nxt.properties
echo "\n" >> $CONF_DIR/nxt.properties

# Tone down logging
echo "java.util.logging.ConsoleHandler.level = INFO" >> $CONF_DIR/logging.properties

# Run BURST wallet (forward ports to localhost)
exec socat tcp-listen:9123,reuseaddr,fork tcp:localhost:8123 \
  & socat tcp-listen:9125,reuseaddr,fork tcp:localhost:8125 \
  & ./burst.sh
