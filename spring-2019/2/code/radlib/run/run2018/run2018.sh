#!/bin/bash

#
# this demo runs on indy2018 data logs
#

SOURCE="${BASH_SOURCE[0]}"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
echo "source=$SOURCE, and ,dir=$DIR"
source $DIR/../../bin/init_env.sh

if [ -z "$_radlibproject_" ]; then
    echo "Radlib should be initialized, quit! Run init cmds like:"
    echo "  source RADLIB_REPO_HOMEDIR/bin/init_env.sh"
    echo "  or"
    echo "  source ~/radlib/bin/init_env.sh"
    exit 0
fi

if [ $# -ne 1 ] ; then
    echo "usage: run2018.sh <logfile>"
    exit -1
fi

#logfile=IPBroadcaster_Input_2018-05-27_0.log
logfile=$(readlink -f $1)

if [ ! -f "${logfile}" ]; then
    echo "logfile ${logfile}  not found, quit"
    exit -1
fi

#
# start
#
mkdir -p run2018
cd run2018


#
# extract telemetry and flaginfo from logfile
#
#extract telemetry
python -m indycar.rplogex --extract --input ${logfile} --output indy2018
#convert flaginfo
python -m indycar.nabcsv --input indy2018-flag.csv --output flaginfo.csv --cmd flag

#
# prepare nab env
#
mkdir runnab
cd runnab
cp -r $_radlibproject_/sub/NAB/data .
cp -r $_radlibproject_/sub/NAB/labels .
cp -r $_radlibproject_/sub/NAB/config .

#
# run anomaly detection on carno=1 with metric vspeed
#
# extract column 3 vspeed
makenabinput.sh ../indy2018-1.csv 3 indy2018-1-vspeed.csv
# make nab files
makejson.sh indy2018-1-vspeed.csv
# runnab
python -m indycar.runnab --skipConfirmation --detector -d numenta --dataDir indycar --windowsFile indycar/indycar_labels.json
# get results
makepdf.sh indy2018-1-vspeed 0.35
makepdf.sh indy2018-1-vspeed 0.55
makepdf.sh indy2018-1-vspeed 0.65

cp indy2018-1-vspeed*.pdf ../../

#done
echo ""
echo ""
echo "========================================================="
echo "Done, check indy2018-1-vspeed*.pdf"
