#!/bin/sh -x

currentParameter=""
parameterExport=""

for commandLineParameter in $*
do \
  case $commandLineParameter in
    ( "-h" ) currentParameter="remotehost=";;
    ( * )    parameterExport="${currentParameter}${commandLineParameter}";;
  esac
done

echo $parameterExport