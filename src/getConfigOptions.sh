#!/bin/sh -x
cat zsr.conf | awk '{ if (match($0, "^$") == 0 && match($0, "^#") == 0) { print $0 } }'