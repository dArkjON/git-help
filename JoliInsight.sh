#bin/bash
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

########################
# Select Coin          #
#                      # 
# BitCore: btx         #
# BitCloud: btdx       #
# BitSend: bsd         #
# MegaCoin: mec        #
#                      #
########################
SELECT_COIN="btx"
SELECT_GIT="LIMXTEC"

####################
# Coin Details     #
####################

# TepmplateCoin (TEMP)
if [[ $SELECT_COIN == "joli" ]] ; then
   COIN_NAME_1="JoliCoin"
   COIN_NAME_2="Jolicoin"
   COIN_NAME_3="jolicoin"
   COIN="JOLI"
   SOURCE="github.com/dalijolijo/JoliCoin" # without https:// or http://
   POSTFIX="-joli"
   DAEMON_1="jolicoind"
   DAEMON_2="Jolicoind"
   CONFIG="jolicoin.conf"
   CONFIG_ENTRY="jolicoin"
   DIR_PART="\.jolicoin" # escaping dot
   DEFAULT_PORT="8555"
   RPC_PORT="8556"
   TOR_PORT="9051"
   WEB="jolicoin.cc" # without https:// or http://
   TICKER="https://api.coinmarketcap.com/v1/ticker/jolicoin/"
   LOGO_LINK="https://insight.bitcore.cc/img/Bitcore-logo-135x135.png"
   LOGO_NAME="joli-logo.png"
fi

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
   TICKER="https://api.coinmarketcap.com/v1/ticker/bitcore/"
   LOGO_LINK="https://insight.bitcore.cc/img/Bitcore-logo-135x135.png"
   LOGO_NAME="btx-logo.png"
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
   TICKER="https://api.coinmarketcap.com/v1/ticker/bitcloud/"
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
   TICKER="https://api.coinmarketcap.com/v1/ticker/bitsend/"
   LOGO_LINK="https://chainz.cryptoid.info/logo/bsd.png"
   LOGO_NAME="bsd-logo.png"
fi

# MegaCoin (MEC)
if [[ $SELECT_COIN == "mex" ]] ; then
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
   TICKER="https://api.coinmarketcap.com/v1/ticker/megacoin/"
   LOGO_LINK="https://chainz.cryptoid.info/logo/mec.png"
   LOGO_NAME="mec-logo.png"
fi

# Reference project variables
REF_COIN_NAME_1="JoliCoin"
REF_COIN_NAME_2="Jolicoin"
REF_COIN_NAME_3="jolicoin"
REF_COIN_1="JOLI"
REF_GIT="dalijolijo"
REF_SOURCE="github.com/dalijolijo/JoliCoin" # without https:// or http://
REF_POSTFIX_1="-joli"
REF_DAEMON_1="jolicoind"
REF_DAEMON_2="Jolicoind"
REF_CONFIG_1="jolicoin.conf"
REF_CONFIG_ENTRY="jolicoin" 
REF_DIR_PART_1="\.jolicoin" # escaping dot
REF_DEFAULT_PORT="8555"
REF_RPC_PORT="8556"
REF_TOR_PORT="9051"
REF_WEB="jolicoin.cc" # without https:// or http://
REF_TICKER="https://api.coinmarketcap.com/v1/ticker/jolicoin/"
REF_LOGO_NAME="joli-logo.png"

# Create Main Directory
mkdir -p ${COIN_NAME_1}
cd ${COIN_NAME_1}
COINDIR=$(pwd)

# bitcore-node
if [[ $NODE -eq 1 ]] ; then
   # Clone bitcore-node reference repo
   cd ${COINDIR}
   git clone https://github.com/dalijolijo/bitcore-node-joli.git
   
   # Copy repo
   PWD=$(pwd)
   DIR_NODE=${PWD}/bitcore-node${POSTFIX}
   cp -r bitcore-node-joli ${DIR_NODE}   

   # Delete log files
   cd ${DIR_NODE}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_1}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace Homepage Link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Price Ticker API Link
   grep -rl "${REF_TICKER}" ./ | grep -v '.git' | xargs sed -i "s#${REF_TICKER}#${TICKER}#g"

   # Replace Coin Source Link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s#${REF_SOURCE}#${SOURCE}#g"   

   # Replace Coin Daemon Name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_1}/${DIR_PART}/g"
   
   # Replace RPC Port
   sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${DIR_NODE}/lib/services/bitcoind.js"

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"

fi 


# insight-api
if [[ $API -eq 1 ]] ; then
   # Clone insight-api reference repo
   cd ${COINDIR}
   git clone https://github.com/dalijolijo/insight-api-joli.git

   # Copy repo
   PWD=$(pwd)
   DIR_API=${PWD}/insight-api${POSTFIX}
   cp -r insight-api-joli ${DIR_API}

   # Delete log files
   cd ${DIR_API}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_1}/${COIN}/g"
   grep -rl "${REF_COIN_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_2}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Price Ticker API Link
   grep -rl "${REF_TICKER}" ./ | grep -v '.git' | xargs sed -i "s#${REF_TICKER}#${TICKER}#g"

   # Replace Coin Source link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s#${REF_SOURCE}#${SOURCE}#g"

   # Replace Coin Daemon name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_2}/${CONFIG}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_3}/${POSTFIX}/g"

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
   cd ${COINDIR}
   git clone https://github.com/dalijolijo/insight-ui-joli.git
  
   # Copy repo
   PWD=$(pwd)
   DIR_UI=${PWD}/insight-ui${POSTFIX}
   cp -r insight-ui-joli ${DIR_UI}

   # Delete log files
   cd ${DIR_UI}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_1}/${COIN}/g"
   grep -rl "${REF_COIN_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_2}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_3}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Price Ticker API Link
   grep -rl "${REF_TICKER}" ./ | grep -v '.git' | xargs sed -i "s#${REF_TICKER}#${TICKER}#g"

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
   cd ${COINDIR}
   git clone https://github.com/dalijolijo/bitcore-lib-joli.git

   # Copy repo
   PWD=$(pwd)
   DIR_LIB=${PWD}/bitcore-lib${POSTFIX}
   cp -r bitcore-lib-joli ${DIR_LIB}

   # Delete log files
   cd ${DIR_LIB}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_1}/${COIN}/g"
   grep -rl "${REF_COIN_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_2}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_3}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Price Ticker API Link
   grep -rl "${REF_TICKER}" ./ | grep -v '.git' | xargs sed -i "s#${REF_TICKER}#${TICKER}#g"

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
   cd ${COINDIR}
   git clone https://github.com/dalijolijo/bitcore-build-joli.git

   # Copy repo
   PWD=$(pwd)
   DIR_BUILD=${PWD}/bitcore-build${POSTFIX}
   cp -r bitcore-build-joli ${DIR_BUILD}

   # Delete log files
   cd ${DIR_BUILD}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_1}/${COIN}/g"
   grep -rl "${REF_COIN_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_2}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_3}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Price Ticker API Link
   grep -rl "${REF_TICKER}" ./ | grep -v '.git' | xargs sed -i "s#${REF_TICKER}#${TICKER}#g"

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
   cd ${COINDIR}
   git clone https://github.com/dalijolijo/bitcore-message-joli.git

   # Copy repo
   PWD=$(pwd)
   DIR_MESSAGE=${PWD}/bitcore-message${POSTFIX}
   cp -r bitcore-message-joli ${DIR_MESSAGE}

   # Delete log files
   cd ${DIR_MESSAGE}
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_1}/${COIN}/g"
   grep -rl "${REF_COIN_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_2}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_1}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_2}/${POSTFIX}/g"
   grep -rl "${REF_POSTFIX_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_POSTFIX_3}/${POSTFIX}/g"

   # Replace Homepage link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s#${REF_WEB}#${WEB}#g"

   # Replace Price Ticker API Link
   grep -rl "${REF_TICKER}" ./ | grep -v '.git' | xargs sed -i "s#${REF_TICKER}#${TICKER}#g"

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
# curl -u dalijolijo https://api.github.com/user/repos -d '{ "name": "bitcore-node-joli" }'

# Push codebase to new Git repository
#git init
#git add .
#git commit -m "inital commit"
#git remote add origin https://github.com/dalijolijo/bitcore-node-joli.git
#git push -u origin master
