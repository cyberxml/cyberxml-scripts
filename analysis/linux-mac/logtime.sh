#! /bin/bash

. env.config

if [ ! -d ../time  ]; then
        mkdir ../time
fi

log2timeline.py ../time/${target}.plaso /mnt/${target}

psort.py -o L2tcsv ../time/${target}.plaso > ../time/${target}.plaso.csv
