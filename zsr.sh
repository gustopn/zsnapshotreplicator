#!/bin/sh -x
# we need to make sure that the script is working its directory no matter where it was called from
# this code needs to be re-usable, because I am making use of it very often (boilerplate)

# in order to know what our remote-side is we need to
# parse command line options
passedCommandLineOptions="$*"
commandLineOptions=`./src/parseCommandLineOptions.sh $passedCommandLineOptions`
if [ -n "$commandLineOptions" ]
then \
  export $commandLineOptions
fi

# check out what filesystems do we have snapshotted on the remote side
syncSnapshots=`./src/getRemoteSnapshotFilesystems.sh $remotehost`

syncFilesystems=$(echo "$syncSnapshots" | awk -F'@' 'BEGIN { out = "" } { if (index(out, $1) == 0) { out = out $1 "\n" } } END { print out }')

# update local synchronized filesystems
if [ -n "$syncFilesystems" ]
then \
  for syncFSinstance in $syncFilesystems
  do \
    ./src/syncRemoteFilesystemLocally.sh $syncFSinstance
  done
fi