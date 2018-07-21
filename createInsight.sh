#/bin/bash
#
# LIMXTEC - dalijolijo (2018)
#
set -x

###############
# Set targets #
###############
NODE="0"
API="1"
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
# TemplateCoin: joli   # 
#                      #
########################
SELECT_COIN="btx"
SELECT_GIT="LIMXTEC"

####################
# Coin Details     #
####################

# Tepmplate: JoliCoin (JOLI)
if [[ $SELECT_COIN == "joli" ]] ; then
   COIN_NAME_1="JoliCoin"
   COIN_NAME_2="Jolicoin"
   COIN_NAME_3="jolicoin"
   COIN="JOLI"
   SOURCE="github.com/dalijolijo/JoliCoin" # without https:// or http://
   POSTFIX_1="-joli"
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

# BitCore (BTX)
if [[ $SELECT_COIN == "btx" ]] ; then
   COIN_NAME_1="BitCore"
   COIN_NAME_2="Bitcore"
   COIN_NAME_3="bitcore"
   COIN="BTX"
   SOURCE="github.com/LIMXTEC/BitCore" # without https:// or http://
   POSTFIX_1="-btx"
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
   POSTFIX_1="-btdx"
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
   POSTFIX_1="-bsd"
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
   POSTFIX_1="-mec"
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
REF_COIN_NAME_1="ZelCash"
REF_COIN_NAME_2="Zelcash"
REF_COIN_NAME_3="zelcash"
REF_COIN_1="BTX"
REF_COIN_2="HUSH"
REF_GIT="TheTrunk"
REF_SOURCE="github.com/zelcash/zelcash" # without https:// or http://
REF_POSTFIX_1="-zelcash"
REF_POSTFIX_2="-hush"
REF_POSTFIX_3="-zen"
REF_DAEMON_1="zelcashd"
REF_DAEMON_2="Zelcashd"
REF_DAEMON_3="hushd"
REF_CONFIG_1="zelcash.conf"
REF_CONFIG_2="hush.conf"
REF_CONFIG_ENTRY_1="zelcash"
REF_CONFIG_ENTRY_2="hush"
REF_CONFIG_ENTRY_3="zen"
REF_DIR_PART_1="\.zelcash" # escaping dot
REF_DIR_PART_2="\.hush" # escaping dot
REF_DEFAULT_PORT=""
REF_RPC_PORT="16124"
REF_TOR_PORT=""
REF_WEB="zel.cash" # without https:// or http://
REF_TICKER="https://stocks.exchange/api2/ticker"
REF_LOGO_NAME=""

function replacement () {
   # Delete log files
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_1}/${COIN}/g"
   grep -rl "${REF_COIN_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_2}/${COIN}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace Homepage Link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s|${REF_WEB}|${WEB}|g"

   # Replace Price Ticker API Link
   grep -rl "${REF_TICKER}" ./ | grep -v '.git' | xargs sed -i "s|${REF_TICKER}|${TICKER}|g"

   # Replace Coin Source Link
   grep -rl "${REF_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s|${REF_SOURCE}|${SOURCE}|g"

   # Replace Coin Daemon Name
   grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
   grep -rl "${REF_DAEMON_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_2}/${DAEMON_2}/g"
   grep -rl "${REF_DAEMON_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_3}/${DAEMON_1}/g"

   # Replace Coin Config name
   grep -rl "${REF_CONFIG_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_1}/${CONFIG}/g"
   grep -rl "${REF_CONFIG_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_2}/${CONFIG}/g"

   # Replace GIT Postfix Name
   grep -rl "${REF_POSTFIX_1}" ./ | grep -v '.git' | xargs sed -i "s|${REF_POSTFIX_1}|${POSTFIX_1}|g"
   grep -rl "${REF_POSTFIX_2}" ./ | grep -v '.git' | xargs sed -i "s|${REF_POSTFIX_2}|${POSTFIX_1}|g"
   grep -rl "${REF_POSTFIX_3}" ./ | grep -v '.git' | xargs sed -i "s|${REF_POSTFIX_3}|${POSTFIX_1}|g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY_1}/${CONFIG_ENTRY}/g"
   grep -rl "${REF_CONFIG_ENTRY_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY_2}/${CONFIG_ENTRY}/g"
   grep -rl "${REF_CONFIG_ENTRY_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY_3}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_1}/${DIR_PART}/g"
   grep -rl "${REF_DIR_PART_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART_2}/${DIR_PART}/g"

   # Replace RPC Port (only bitcore-node)
   if [[ $1 == "NODE" ]] ; then
      sed -i "s/${REF_RPC_PORT}/${RPC_PORT}/g" "${NODE_DIR}/lib/services/bitcoind.js"
   fi

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"

   if [[ $1 == "UI" ]] ; then
      # Download logo and add it to the repo
      # mkdir -p ${UI_DIR}/TODO/img
      # cd ${UI_DIR}/TODO/img
       wget ${LOGO} .
   fi
}


# Create Main Directory
mkdir -p ${COIN_NAME_1}
cd ${COIN_NAME_1}
COIN_DIR=$(pwd)

# bitcore-node
if [[ $NODE -eq 1 ]] ; then
   # Clone bitcore-node reference repo
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/bitcore-node${REF_POSTFIX_1}.git
   
   # Copy repo
   NODE_DIR=${COIN_DIR}/bitcore-node${POSTFIX_1}
   cp -r bitcore-node${REF_POSTFIX_1} ${NODE_DIR}   
   cd ${NODE_DIR}

   # Use function replace
   replace "NODE"
fi

# insight-api
if [[ $API -eq 1 ]] ; then
   # Clone insight-api reference repo
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/insight-api${REF_POSTFIX_1}.git

   # Copy repo
   API_DIR=${COIN_DIR}/insight-api${POSTFIX_1}
   cp -r insight-api${REF_POSTFIX_1} ${API_DIR}
   cd ${API_DIR}

   # Use function replace
   replacement "API"
fi

# insight-ui
if [[ $UI -eq 1 ]] ; then
   # Clone insight-ui reference repo
   cd ${COIN_DIR}
   git clone https://github.com/TheTrunk/insight-ui${REF_POSTFIX_1}.git

   # Copy repo
   UI_DIR=${COIN_DIR}/insight-ui${POSTFIX_1}
   cp -r insight-ui${REF_POSTFIX_1} ${UI_DIR}
   cd ${UI_DIR}

   # Use function replace
   replace "UI"
fi

# bitcore-lib
if [[ $LIB -eq 1 ]] ; then
   # Clone bitcore-lib reference repo
   cd ${COIN_DIR}
   git clone https://github.com/TheTrunk/bitcore-lib${REF_POSTFIX_1}.git

   # Copy repo
   LIB_DIR=${COIN_DIR}/bitcore-lib${POSTFIX_1}
   cp -r bitcore-lib${REF_POSTFIX_1} ${LIB_DIR}
   cd ${LIB_DIR}

   # Use function replace
   replace "LIB"
fi

# bitcore-build
if [[ $BUILD -eq 1 ]] ; then
   # Clone bitcore-build reference repo
   cd ${COIN_DIR}
   git clone https://github.com/TheTrunk/bitcore-build${REF_POSTFIX_1}.git

   # Copy repo
   BUILD_DIR=${COIN_DIR}/bitcore-build${POSTFIX_1}
   cp -r bitcore-build${REF_POSTFIX_1} ${BUILD_DIR}
   cd ${BUILD_DIR}

   # Use function replace
   replace "BUILD"
fi

# bitcore-message
if [[ $MESSAGE -eq 1 ]] ; then
   # Clone bitcore-message reference repo
   cd ${COIN_DIR}
   git clone https://github.com/TheTrunk/bitcore-message${REF_POSTFIX_1}.git

   # Copy repo
   MESSAGE_DIR=${COIN_DIR}/bitcore-message${POSTFIX_1}
   cp -r bitcore-message${REF_POSTFIX_1} ${MESSAGE_DIR}
   cd ${MESSAGE_DIR}

   # Use function replace
   replace "MESSAGE"
fi


# Create remote Git Repository
# curl -u dalijolijo https://api.github.com/user/repos -d '{ "name": "bitcore-node-joli" }'

# Push codebase to new Git repository
#git init
#git add .
#git commit --message=

