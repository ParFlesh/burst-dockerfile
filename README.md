# burst-dockerfile
Dockerfile for Burst Miner & Plotter (Linux)

* **Plotter:** omdcct v0.1 (https://github.com/alter3d/omdcct)
* **Miner:** creepMiner v1.7.6 (https://github.com/Creepsky/creepMiner)

:moneybag: Donations welcomed at `BURST-8GDX-8DTV-MHNB-HQX3F` :bow:

### Plotting via Docker
    docker run -it \
      -v /home/burst:/mnt/burst \
      ewrogers/burst-plotter:latest \
      ./plot -k $WALLET_NUMERIC_ID -d /mnt/burst/plots -n 614400
#### Plotting using AVX2
    docker run -it \
      -v /home/burst:/mnt/burst \
      ewrogers/burst-plotter:latest \
      ./plotavx2 -k $WALLET_NUMERIC_ID -x 2 -d /mnt/burst/plots -n 614400


**NOTE:** See [omdcct usage](https://github.com/alter3d/omdcct) for more information on command line arguments.

### Mining via Docker
    docker run -d \
      -p 8080:8080 \
      -v /home/miner:/mnt/miner \
      --restart always \
      --name creep-miner \
      ewrogers/creep-miner:latest
      
**NOTE:** This assumes your `mining.conf` is in the directory mounted as `/mnt/miner` from the host (i.e. `/home/miner`).

You can mount one or more additional volumes for plots, **example:** `-v /media/usb/disk1:/mnt/disk1`

See [Setting up the Miner](https://github.com/Creepsky/creepMiner/wiki/Setting-up-the-miner) for more information on configuration options.
