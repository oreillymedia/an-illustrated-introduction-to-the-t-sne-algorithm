#!/bin/bash

# Strict mode
nginx
ipython2 notebook --no-browser --port 8888 --ip=* $CERTFILE_OPTION --NotebookApp.password="$HASH" --NotebookApp.allow_origin=*