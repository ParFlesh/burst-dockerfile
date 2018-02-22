#!/bin/bash -e

# Make link to config
if [ ! -f ./mining.conf ]
  ln -s $CREEP_MINER_DATADIR/mining.conf ./mining.conf
fi

exec creepMiner ./mining.conf
