#!/bin/sh -x

# in order to know where do we save our copy of remote zfs filesystems we need to 
# parse the config file

./src/getConfigOptions.sh

# check what filesystems do we have locally

./src/getLocalSnapshotFilesystems.sh
