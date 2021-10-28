#!/usr/bin/env bash

if [ -z "$(ls -A $PGDATA)" ]; then
  initdb -E UTF8 --locale=C
fi

exec "$@"
