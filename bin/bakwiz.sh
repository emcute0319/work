#!/bin/sh

rq=`date +%Y%m%d%H`

rm -f /home/svnbak/`date -d '-5 days' +%Y%m%d%H`.tar.gz

cd ~
tar zcvf ~/proj/tarbak/wiznote/$rq.tar.gz .wiznote > /dev/null 2>&1
cd -
