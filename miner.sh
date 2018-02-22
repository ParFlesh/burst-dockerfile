#!/bin/bash -e

ln -s $CREEP_MINER_DATADIR/mining.conf ./mining.conf
exec creepMiner ./mining.conf
