#/bin/bash
#
# LIMXTEC - dalijolijo (2018)
#
set -x

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
SELECT_GIT="LIMXTEC"

####################
# Coin Details     #
####################

# BitCoin (BTX)
if [[ $SELECT_COIN == "btx" ]] ; then
   COIN_NAME_1="BitCore"
   COIN_NAME_2="Bitcore"
   COIN_NAME_3="bitcore"
   COIN="BTX"
   SOURCE="github.com/LIMXTEC/BitCore" # without https:// or http://
   POSTFIX="-btx"
   DAEMON_1="bitcored"
   DAEMON_2="Bitcored"
   CONFIG="bitcore.conf"
   CONFIG_ENTRY="bitcore"
   DIR_PART="\.bitcore" # escaping dot
   DEFAULT_PORT="8555"
   RPC_PORT="8556"
   TOR_PORT="9051"
   WEB="bitcore.cc" # without https:// or http://
   LOGO_LINK="https://insight.bitcore.cc/img/Bitcore-logo-135x135.png"
   LOGO_NAME="btx-log.png"
fi

# BitCloud (BTDX)
if [[ $SELECT_COIN == "btdx" ]] ; then
   COIN_NAME_1="BitCloud"
   COIN_NAME_2="Bitcloud"
   COIN_NAME_3="bitcloud"
   COIN="BTDX"
   SOURCE="github.com/LIMXTEC/Bitcloud" # without https:// or http://
   POSTFIX="-btdx"
   DAEMON_1="bitcloudd"
   DAEMON_2="Bitcloudd"
   CONFIG="bitcloud.conf"
   CONFIG_ENTRY="bitcloud"
   DIR_PART="\.bitcloud" # escaping dot
   DEFAULT_PORT="8329"
   RPC_PORT="8330"
   TOR_PORT="9050"
   WEB="bit-cloud.info" # without https:// or http://
   LOGO_LINK="https://chainz.cryptoid.info/logo/btdx.png"
   LOGO_NAME="btdx-logo.png"
fi

# BitSend (BSD)
if [[ $SELECT_COIN == "bsd" ]] ; then
   COIN_NAME_1="BitSend"
   COIN_NAME_2="Bitsend"
   COIN_NAME_3="bitsend"
   COIN="BSD"
   SOURCE="github.com/LIMXTEC/BitSend" # without https:// or http://
   POSTFIX="-bsd"
   DAEMON_1="bitsendd"
   DAEMON_2="Bitsendd"
   CONFIG="bitsend.conf"
   CONFIG_ENTRY="bitsend"
   DIR_PART="\.bitsend" # escaping dot
   DEFAULT_PORT="8886"
   RPC_PORT="8800"
   TOR_PORT="9051"
   WEB="bitsend.info" # without https:// or http://
   LOGO_LINK="https://chainz.cryptoid.info/logo/bsd.png"
   LOGO_NAME="bsd-logo.png"
fi

# MegaCoin (MEC)
if [[ $SELECT_COIN == "btdx" ]] ; then
   COIN_NAME_1="MegCoin"
   COIN_NAME_2="Megcoin"
   COIN_NAME_3="megcoin"
   COIN="MEC"
   SOURCE="github.com/LIMXTEC/Megacoin" # without https:// or http://
   POSTFIX="-mec"
   DAEMON_1="megacoind"
   DAEMON_2="Megacoind"
   CONFIG="megacoin.conf"
   CONFIG_ENTRY="megacoin"
   DIR_PART="\.megacoin" # escaping dot
   DEFAULT_PORT="8329"
   RPC_PORT="8556"
   TOR_PORT="9051"
   WEB="www.megacoin.eu" # without https:// or http://
   LOGO_LINK="https://chainz.cryptoid.info/logo/mec.png"
   LOGO_NAME="mec-logo.png"
fi


# Reference project variables
REF_COIN_NAME_1="ZelCash"
REF_COIN_NAME_2="Zelcash"
REF_COIN_NAME_3="zelcash"
REF_COIN="ZEL"
REF_GIT="TheTrunk"
REF_SOURCE="github.com/zelcash/zelcash" # without https:// or http://
REF_POSTFIX_1="-zelcash"
REF_POSTFIX_2="-hush"
REF_DAEMON_1="zelcashd"
REF_DAEMON_2="Zelcashd"
REF_DAEMON_3="hushd"
REF_CONFIG_1="zelcash.conf"
REF_CONFIG_2="hush.conf"
REF_CONFIG_ENTRY="zelcash" 
REF_DIR_PART_1="\.zelcash" # escaping dot
REF_DIR_PART_2="\.hush" # escaping dot
REF_DEFAULT_PORT=""
REF_RPC_PORT="16124"
REF_TOR_PORT=""
REF_WEB="zel.cash" # without https:// or http://
REF_LOGO_NAME=""

# Create Main Directory
mkdir -p ${COIN_NAME_1}
cd ${COIN_NAME_1}


# bitcore-node
if [[ $NODE -eq 1 ]] ; then
   # Clone bitcore-node reference repo
   git clone https://github.com/TheTrunk/bitcore-node-zelcash.git
   
   # Copy repo
   PWD=$(pwd)
   DIR_NODE=${PWD}/bitcore-node${POSTFIX}
   cp -r bitcore-node-zelcash ${DIR_NODE}   

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Coin Source link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s#${REF_SOURCE}#${SOURCE}#g"   

   # Replace Coin Daemon name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_2}/${CONFIG}/g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_1}/${DIR_PART}/g"
   grep -rl "${REF_DIR_PART_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_2}/${DIR_PART}/g"

   # Replace RPC port
   sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${DIR_NODE}/lib/services/bitcoind.js"

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"

fi 


# insight-api
if [[ $API -eq 1 ]] ; then
   # Clone insight-api reference repo
   git clone https://github.com/TheTrunk/insight-api-zelcash.git

   # Copy repo
   PWD=$(pwd)
   DIR_NODE=${PWD}/bitcore-node${POSTFIX}
   cp -r bitcore-node-zelcash ${DIR_NODE}

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Coin Source link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s#${REF_SOURCE}#${SOURCE}#g"

   # Replace Coin Daemon name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_2}/${CONFIG}/g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_1}/${DIR_PART}/g"
   grep -rl "${REF_DIR_PART_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_2}/${DIR_PART}/g"

   # Replace RPC port
   sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${DIR_NODE}/lib/services/bitcoind.js"

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"
   
fi


# insight-ui
if [[ $UI -eq 1 ]] ; then
   # Clone insight-ui reference repo
   git clone https://github.com/TheTrunk/insight-ui-zelcash.git
  
   # Copy repo
   PWD=$(pwd)
   DIR_NODE=${PWD}/bitcore-node${POSTFIX}
   cp -r bitcore-node-zelcash ${DIR_NODE}

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Coin Source link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s#${REF_SOURCE}#${SOURCE}#g"

   # Replace Coin Daemon name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_2}/${CONFIG}/g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_1}/${DIR_PART}/g"
   grep -rl "${REF_DIR_PART_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_2}/${DIR_PART}/g"

   # Replace RPC port
   sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${DIR_NODE}/lib/services/bitcoind.js"

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"

   # Download logo and add it to the repo
   # mkdir -p ${DIR_UI}/TODO/img
   # cd ${DIR_UI}/TODO/img
   # wget ${LOGO} .

fi


# bitcore-lib
if [[ $LIB -eq 1 ]] ; then
   # Clone bitcore-lib reference repo
   git clone https://github.com/TheTrunk/bitcore-lib-zelcash.git

   # Copy repo
   PWD=$(pwd)
   DIR_NODE=${PWD}/bitcore-node${POSTFIX}
   cp -r bitcore-node-zelcash ${DIR_NODE}

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Coin Source link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s#${REF_SOURCE}#${SOURCE}#g"

   # Replace Coin Daemon name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_2}/${CONFIG}/g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_1}/${DIR_PART}/g"
   grep -rl "${REF_DIR_PART_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_2}/${DIR_PART}/g"

   # Replace RPC port
   sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${DIR_NODE}/lib/services/bitcoind.js"

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"

fi


# bitcore-build
if [[ $BUILD -eq 1 ]] ; then
   # Clone bitcore-build reference repo
   git clone https://github.com/TheTrunk/bitcore-build-zelcash.git

   # Copy repo
   PWD=$(pwd)
   DIR_NODE=${PWD}/bitcore-node${POSTFIX}
   cp -r bitcore-node-zelcash ${DIR_NODE}

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Coin Source link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s#${REF_SOURCE}#${SOURCE}#g"

   # Replace Coin Daemon name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_2}/${CONFIG}/g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_1}/${DIR_PART}/g"
   grep -rl "${REF_DIR_PART_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_2}/${DIR_PART}/g"

   # Replace RPC port
   sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${DIR_NODE}/lib/services/bitcoind.js"

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"

fi


# bitcore-message
if [[ $MESSAGE -eq 1 ]] ; then
   # Clone bitcore-message reference repo
   git clone https://github.com/TheTrunk/bitcore-message-zelcash.git

   # Copy repo
   PWD=$(pwd)
   DIR_NODE=${PWD}/bitcore-node${POSTFIX}
   cp -r bitcore-node-zelcash ${DIR_NODE}

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Coin Source link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s#${REF_SOURCE}#${SOURCE}#g"

   # Replace Coin Daemon name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_2}/${CONFIG}/g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_1}/${DIR_PART}/g"
   grep -rl "${REF_DIR_PART_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_2}/${DIR_PART}/g"

   # Replace RPC port
   sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${DIR_NODE}/lib/services/bitcoind.js"

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"

fi


# Create remote Git Repository
#cd ./${PROJECT}
#git init
#git add .
#git commit --message=

