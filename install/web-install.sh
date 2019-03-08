#!/bin/bash

echo -e "\033[0;34m                                  %######################%
                         ########################################&
                   ##############/                    ################
              ############      ####################      ###############
          ##########(    #########(##################     ###############
       ##########   ######  #########  ###############    /###############
     #########   ######## ############# ################    (###############
   ##########  ###########%#########(  ################     ################
 ############  ################    ##################      #################
##############              %#####################       ##################
##############################################/       ####################
##########################################         ######################
 ###################################/           ########################
    #######################(                ##########################
                                       #############################
                                   ##############################(
                                   ############################
                                  ##########################
                                 ########################
                               #######################
                              ####################
                             #################
                             ############(
                             #######/
                             (

                     _       _            _ _ _
                 ___| |_ ___| | ___      | (_) |_ ___
                / __| __/ _ \ |/ _ \_____| | | __/ _ \\
                \__ \ ||  __/ |  __/_____| | | ||  __/
                |___/\__\___|_|\___|     |_|_|\__\___|
\033[0m";

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ACCOUNT="scimusmn"
REPO="SteleLite-AppTemplate"
DEBUG=""

while getopts :a:r:d option
do
case "${option}"
in
a) ACCOUNT=${OPTARG};;
r) REPO=${OPTARG};;
d) DEBUG="-d";;
?) echo "${OPTARG}";;
esac
done

sudo mkdir -p /usr/local/src/setup

sudo chmod 777 /usr/local/src/setup

cd /usr/local/src/setup

curl -sL "https://raw.githubusercontent.com/${ACCOUNT}/${REPO}/master/config/machine.js" -o machine.js

curl -sL "https://raw.githubusercontent.com/scimusmn/stele-lite/master/install/main.sh" -o install.sh

chmod 777 ./install.sh

./install.sh -s /usr/local/src/setup -r $REPO -a $ACCOUNT "$@"
#-u "$ACCOUNT" -r "$REPO" $DEBUG
