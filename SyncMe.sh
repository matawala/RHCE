#!/bin/bash
echo "# rsync -av -e 'ssh -l root' `pwd` 192.168.56.102:/data/"
rsync -av -e 'ssh -l root' `pwd` 192.168.56.102:/data/
