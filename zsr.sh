#!/bin/sh -x
# we need to make sure that the script is working its directory no matter where it was called from
# this code needs to be re-usable, because I am making use of it very often (boilerplate)

# in order to know what our remote-side is we need to
# parse command line options
passedCommandLineOptions="$*"
commandLineOptions=`./src/parseCommandLineOptions.sh $passedCommandLineOptions`
export $commandLineOptions
# check out what filesystems do we have snapshotted on the remote side
syncFilesystems=`./src/getRemoteSnapshotFilesystems.sh $remotehost`

# update local synchronized filesystems
if [ -n "$syncFilesystems" ] && false
then \
  for syncFSinstance in $syncFilesystems
  do \
    ./src/syncRemoteFilesystemLocally.sh $syncFSinstance
  done
fi