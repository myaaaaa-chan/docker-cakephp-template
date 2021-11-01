#!/bin/sh

initdb -E UTF8 --pgdata=$PGDATA

count=`ps -ef | grep postgresql | grep -v grep | wc -l`
if [ $count = 0 ]; then
  postgres -D ${PGDATA} -p ${PGPORT}
fi
