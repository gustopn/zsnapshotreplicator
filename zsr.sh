#!/bin/sh -x
# we need to make sure that the script is working its directory no matter where it was called from
# this code needs to be re-usable, because I am making use of it very often (boilerplate)

# in order to know what our remote-side is we need to
# parse command line options

commandLineOption=`./src/parseCommandLineOptions.sh`

# check out what filesystems do we have snapshotted on the remote side

./src/getRemoteSnapshotFilesystems.sh

# in order to know where do we save our copy of remote zfs filesystems we need to 
# parse the config file

./src/getConfigOptions.sh

# check what filesystems do we have locally

./src/getLocalSnapshotFilesystems.sh

echo $commandLineOption
