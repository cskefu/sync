#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
cwdDir=$PWD
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH
export TS=$(date +%Y%m%d%H%M%S)

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
echo "First install pm2 by `npm install -g pm2`"
cd $baseDir/../app
source .env
#export $(grep -v '^#' .env | xargs -d '\n')
echo $DEBUG

set -x
pm2 start app.js -n cskefu.sync
