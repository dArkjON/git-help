#/bin/bash
#
# LIMXTEC - dalijolijo (2018)
#
set -x

COIN_NAME="BitCloud"
COIN="BTDX"
PROJECT_POSTFIX="btdx"
DAEMON="bitcloudd"
DEFAULT_PORT="8555"
RPC_PORT="8556"
TOR_PORT="9051"
WEB="bitcore.cc"

# Set targets
NODE="1"
API="0"
UI="0"
LIB="0"
BUILD="0"
MESSAGE="0"

# Reference project variables
REF_GIT="TheTrunk"
REF_COIN="ZEL"
REF_POSTFIX="zelcash"
DAEMON="zelchashd"
DEFAULT_PORT="8555"
RPC_PORT="8556"
TOR_PORT="9051"
WEB="zelchash.cc"

# Create Main Directory
mkdir -p ${COIN_NAME}
cd ${COIN_NAME}


# bitcore-node
if [[ $NODE -eq 1 ]] ; then
   # Clone bitcore-node reference repo
   git clone https://github.com/TheTrunk/bitcore-node-zelcash.git
   
   # Copy repo
   PWD=$(pwd)
   DIR_NODE=${PWD}/bitcore-node-${PROJECT_POSTFIX}
   cp bitcore-node-zelcash ${DIR_NODE}   

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log


   printf "bitcore-node\n"
fi 


# insight-api
if [[ $API -eq 1 ]] ; then
    # Clone insight-api reference repo
    git clone https://github.com/TheTrunk/insight-api-zelcash.git
   printf "insight-api\n"
fi


# insight-ui
if [[ $UI -eq 1 ]] ; then
   # Clone insight-ui reference repo
   git clone https://github.com/TheTrunk/insight-ui-zelcash.git
  
    printf "insight-ui\n"
fi


# bitcore-lib
if [[ $LIB -eq 1 ]] ; then
   # Clone bitcore-lib reference repo
   git clone https://github.com/TheTrunk/bitcore-lib-zelcash.git
   printf "bitcore-lib\n"
fi


# bitcore-build
if [[ $BUILD -eq 1 ]] ; then
   # Clone bitcore-build reference repo
   git clone https://github.com/TheTrunk/bitcore-build-zelcash.git
   printf "bitcore-build\n"
fi


# bitcore-message
if [[ $MESSAGE -eq 1 ]] ; then
   # Clone bitcore-message reference repo
   git clone https://github.com/TheTrunk/bitcore-message-zelcash.git
   printf "bitcore-message\n"
fi


#
#cd ./${PROJECT}
#git init
#git add .
#git commit --message=

