#!/bin/sh -x
if [ -n "$1" ]
then \
  ssh $1 zfs list
fi