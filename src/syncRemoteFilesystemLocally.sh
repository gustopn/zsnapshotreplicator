#!/bin/sh -x

# in order to know where do we save our copy of remote zfs filesystems we need to 
# parse the config file
configOptions=`./src/getConfigOptions.sh`

zfsSnapshotLocalPath=`echo $configOptions | ./src/getLocalZFSpath.sh`

# check what filesystems do we have locally
localSnapshotFilesystemList=`./src/getLocalSnapshotFilesystems.sh $zfsSnapshotLocalPath`

# see what the latest snapshot of a filesystem is
if [ -n "$localSnapshotFilesystemList" ]
then \
  for localSnapshotFilesystemInstance in $localSnapshotFilesystemList
  do \
    ./src/getRemoteSnapshotCurrent.sh $localSnapshotFilesystemInstance
  done
fi