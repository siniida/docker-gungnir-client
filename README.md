# siniida/gungnir-client

[![](https://badge.imagelayers.io/siniida/gungnir-client:latest.svg)](https://imagelayers.io/?images=siniida/gungnir-client:latest 'Get your own badge on imagelayers.io')

for gennai cluster. ([gennai.docker](https://github.com/siniida/gennai.docker))

## Require

* Apache ZooKeeper

## Example

### 1. run ZooKeeper

use [docker-zookeeper](https://github.com/siniida/docker-zookeeper).

    $ ../docker-zookeeper/cluster.sh start

### 2. run gungnir-client container.

    $ docker run -ti --rm --link zk1:zk1 --link zk2:zk2 --link zk3:zk3 siniida/gungnir-client

or

    $ docker run -ti --rm -e ZOOKEEPER=zk1:2181,zk2:2181,zk3:2181 siniida/gungnir-client

