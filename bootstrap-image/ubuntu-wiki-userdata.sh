#!/bin/bash
REFDATAMOUNT=/reference-data
REFDATAEFSURL=fs-8b589eb2.efs.ap-southeast-2.amazonaws.com
apt-get install nfs-common
mkdir ${REFDATAMOUNT}
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${REFDATAEFSURL}:/ ${REFDATAMOUNT}
/bin/bash ${REFDATAMOUNT}/awstesting/bootstrap-image/ubuntu-wiki
