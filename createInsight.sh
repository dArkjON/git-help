#/bin/bash
#
# LIMXTEC - dalijolijo (2018)
#
#set -x

###############
# Set targets #
###############
NODE="1"
API="0"
UI="0"
LIB="0"
BUILD="0"
MESSAGE="0"

####################
# Select Coin      #
#                  # 
# BitCore: btx     #
# BitCloud: btdx   #
# BitSend: bsd     #
# MegaCoin: mec    #
#                  #
####################
SELECT_COIN="btx"

####################
# Coin Details     #
####################

# BitCoin (BTX)
if [[ $SELECT_COIN == "btx" ]] ; then
   COIN_NAME="BitCore"
   COIN="BTX"
   SOURCE="https://github.com/LIMXTEC/BitCore"
   POSTFIX="-btx"
   DAEMON_1="bitcored"
   DAEMON_2="Bitcored"
   CONFIG="bitcore.conf"
   DEFAULT_PORT="8555"
   RPC_PORT="8556"
   TOR_PORT="9051"
   WEB="https://bitcore.cc"
   LOGO_LINK="https://insight.bitcore.cc/img/Bitcore-logo-135x135.png"
   LOGO_NAME="btx-log.png"
fi

# BitCloud (BTDX)
if [[ $SELECT_COIN == "btdx" ]] ; then
   COIN_NAME="BitCloud"
   COIN="BTDX"
   SOURCE="https://github.com/LIMXTEC/Bitcloud"
   POSTFIX="-btdx"
   DAEMON="bitcloudd"
   DEFAULT_PORT="8329"
   RPC_PORT="8330"
   TOR_PORT="9050"
   WEB="https://bit-cloud.info"
   LOGO_LINK="https://chainz.cryptoid.info/logo/btdx.png"
   LOGO_NAME="btdx-logo.png"
fi

# BitSend (BSD)
if [[ $SELECT_COIN == "bsd" ]] ; then
   COIN_NAME="BitSend"
   COIN="BSD"
   SOURCE="https://github.com/LIMXTEC/BitSend"
   POSTFIX="-bsd"
   DAEMON="bitsendd"
   DEFAULT_PORT="8886"
   RPC_PORT="8800"
   TOR_PORT="9051"
   WEB="https://bitsend.info/"
   LOGO_LINK="https://chainz.cryptoid.info/logo/bsd.png"
   LOGO_NAME="bsd-logo.png"
fi

# MegaCoin (MEC)
if [[ $SELECT_COIN == "btdx" ]] ; then
   COIN_NAME="MegCoin"
   COIN="MEC"
   SOURCE="https://github.com/LIMXTEC/Megacoin"
   POSTFIX="-mec"
   DAEMON="mecd"
   DEFAULT_PORT="8329"
   RPC_PORT="8556"
   TOR_PORT="9051"
   WEB="https://www.megacoin.eu/"
   LOGO_LINK="https://chainz.cryptoid.info/logo/mec.png"
   LOGO_NAME="mec-logo.png"
fi


# Reference project variables
REF_GIT="TheTrunk"
REF_COIN_NAME="ZelCash"
REF_COIN="ZEL"
REF_SOURCE="https://github.com/zelcash/zelcash"
REF_POSTFIX_1="-zelcash"
REF_POSTFIX_2="-hush"
REF_DAEMON_1="zelcashd"
REF_DAEMON_2="Zelcashd"
REF_DAEMON_3="hushd"
REF_CONFIG_1="zelcash.conf"
REF_CONFIG_2="hush.conf"
REF_DEFAULT_PORT=""
REF_RPC_PORT="16124"
REF_TOR_PORT=""
REF_WEB="http://zel.cash"
REF_LOGO_NAME=""

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
   cp -r bitcore-node-zelcash ${DIR_NODE}   

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log

   # Replace Coin name
   grep -rl "${REF_COIN_NAME}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME}/${COIN_NAME}/g"

   # Replace Coin abbreviation
   grep -rl "${REF_COIN}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN}/${COIN}/g"

   # Replace GIT Postfix name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"

   # Replace  name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${CONFIG}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s/${REF_WEB}/${WEB}/g"

   # Replace Coin Source link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s/${REF_SOURCE}/${SOURCE}/g"   

   # Replace Coin Daemon name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${CONFIG}/g"

   # Replace RPC port
   sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${DIR_NODE}/lib/services/bitcoind.js"

fi 


# insight-api
if [[ $API -eq 1 ]] ; then
   # Clone insight-api reference repo
   git clone https://github.com/TheTrunk/insight-api-zelcash.git

   
fi


# insight-ui
if [[ $UI -eq 1 ]] ; then
   # Clone insight-ui reference repo
   git clone https://github.com/TheTrunk/insight-ui-zelcash.git
  

   # Download logo and add it to the repo
   # mkdir -p ${DIR_UI}/TODO/img
   # cd ${DIR_UI}/TODO/img
   # wget ${LOGO} .

fi


# bitcore-lib
if [[ $LIB -eq 1 ]] ; then
   # Clone bitcore-lib reference repo
   git clone https://github.com/TheTrunk/bitcore-lib-zelcash.git
fi


# bitcore-build
if [[ $BUILD -eq 1 ]] ; then
   # Clone bitcore-build reference repo
   git clone https://github.com/TheTrunk/bitcore-build-zelcash.git
fi


# bitcore-message
if [[ $MESSAGE -eq 1 ]] ; then
   # Clone bitcore-message reference repo
   git clone https://github.com/TheTrunk/bitcore-message-zelcash.git
fi


#
#cd ./${PROJECT}
#git init
#git add .
#git commit --message=

