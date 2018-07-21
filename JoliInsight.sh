#bin/bash
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
#                      #
########################
SELECT_COIN="btx"
SELECT_GIT="LIMXTEC"

####################
# Coin Details     #
####################

# BitCore (BTX)
if [[ $SELECT_COIN == "btx" ]] ; then
   COIN_NAME_1="BitCore"
   COIN_NAME_2="Bitcore"
   COIN_NAME_3="bitcore"
   COIN="BTX"
   SOURCE="github.com/LIMXTEC/BitCore" # without https:// or http://
   POSTFIX="-btx"
   REP_1="node-btx"
   REP_2="api-btx"
   REP_3="ui-btx"
   REP_4="lib-btx"
   REP_5="build-btx"
   REP_6="message-btx"
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
   REP_1="node-btdx"
   REP_2="api-btdx"
   REP_3="ui-btdx"
   REP_4="lib-btdx"
   REP_5="build-btdx"
   REP_6="message-btdx"
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
   REP_1="node-bsd"
   REP_2="api-bsd"
   REP_3="ui-bsd"
   REP_4="lib-bsd"
   REP_5="build-bsd"
   REP_6="message-bsd"
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
if [[ $SELECT_COIN == "mec" ]] ; then
   COIN_NAME_1="MegCoin"
   COIN_NAME_2="Megcoin"
   COIN_NAME_3="megcoin"
   COIN="MEC"
   SOURCE="github.com/LIMXTEC/Megacoin" # without https:// or http://
   POSTFIX="-mec"
   REP_1="node-mec"
   REP_2="api-mec"
   REP_3="ui-mec"
   REP_4="lib-mec"
   REP_5="build-mec"
   REP_6="message-mec"
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
REF_COIN="JOLI"
REF_GIT="dalijolijo"
REF_SOURCE="github.com/dalijolijo/JoliCoin" # without https:// or http://
REF_POSTFIX="-joli"
REF_REP_1="node-joli"
REF_REP_2="api-joli"
REF_REP_3="ui-joli"
REF_REP_4="lib-joli"
REF_REP_5="build-joli"
REF_REP_6="message-joli"
REF_DAEMON_1="jolicoind"
REF_DAEMON_2="Jolicoind"
REF_CONFIG="jolicoin.conf"
REF_CONFIG_ENTRY="jolicoin" 
REF_DIR_PART="\.jolicoin" # escaping dot
REF_DEFAULT_PORT="8555"
REF_RPC_PORT="8556"
REF_TOR_PORT="9051"
REF_WEB="jolicoin.cc" # without https:// or http://
REF_TICKER="https://api.coinmarketcap.com/v1/ticker/jolicoin/"
REF_LOGO_NAME="joli-logo.png"

function replacement () {
   # Delete log files
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN}/${COIN}/g"

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

   # Replace Coin Config name
   grep -rl "${REF_CONFIG}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG}/${CONFIG}/g"

   # Replace GIT Postfix Name
   #grep -rl "${REF_POSTFIX}" ./ | grep -v '.git' | xargs sed -i "s|${REF_POSTFIX}|${POSTFIX}|g"

   # Replace Insight Repository Names
   grep -rl "${REF_REP_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_REP_1}/${REP_1}/g"
   grep -rl "${REF_REP_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_REP_2}/${REP_2}/g"
   grep -rl "${REF_REP_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_REP_3}/${REP_3}/g"
   grep -rl "${REF_REP_4}" ./ | grep -v '.git' | xargs sed -i "s/${REF_REP_4}/${REP_4}/g"
   grep -rl "${REF_REP_5}" ./ | grep -v '.git' | xargs sed -i "s/${REF_REP_5}/${REP_5}/g"
   grep -rl "${REF_REP_6}" ./ | grep -v '.git' | xargs sed -i "s/${REF_REP_6}/${REP_6}/g"

   # Replace Coin Config Entry
   grep -rl "${REF_CONFIG_ENTRY}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CONFIG_ENTRY}/${CONFIG_ENTRY}/g"

   # Replace part of Coin Path
   grep -rl "${REF_DIR_PART}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DIR_PART}/${DIR_PART}/g"

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
   git clone https://github.com/${REF_GIT}/bitcore-node${REF_POSTFIX}.git
   
   # Copy repo
   NODE_DIR=${COIN_DIR}/bitcore-node${POSTFIX}
   cp -r bitcore-node${REF_POSTFIX} ${NODE_DIR}   
   cd ${NODE_DIR}

   # Use function replace
   replacement "NODE"
fi

# insight-api
if [[ $API -eq 1 ]] ; then
   # Clone insight-api reference repo
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/insight-api${REF_POSTFIX}.git

   # Copy repo
   API_DIR=${COIN_DIR}/insight-api${POSTFIX}
   cp -r insight-api${REF_POSTFIX} ${API_DIR}
   cd ${API_DIR}

   # Use function replace
   replacement "API"
fi

# insight-ui
if [[ $UI -eq 1 ]] ; then
   # Clone insight-ui reference repo
   cd ${COIN_DIR}
   git clone https://github.com/TheTrunk/insight-ui${REF_POSTFIX}.git

   # Copy repo
   UI_DIR=${COIN_DIR}/insight-ui${POSTFIX}
   cp -r insight-ui${REF_POSTFIX} ${UI_DIR}
   cd ${UI_DIR}

   # Use function replace
   replacement "UI"
fi

# bitcore-lib
if [[ $LIB -eq 1 ]] ; then
   # Clone bitcore-lib reference repo
   cd ${COIN_DIR}
   git clone https://github.com/TheTrunk/bitcore-lib${REF_POSTFIX}.git

   # Copy repo
   LIB_DIR=${COIN_DIR}/bitcore-lib${POSTFIX}
   cp -r bitcore-lib${REF_POSTFIX} ${LIB_DIR}
   cd ${LIB_DIR}

   # Use function replace
   replacement "LIB"
fi

# bitcore-build
if [[ $BUILD -eq 1 ]] ; then
   # Clone bitcore-build reference repo
   cd ${COIN_DIR}
   git clone https://github.com/TheTrunk/bitcore-build${REF_POSTFIX}.git

   # Copy repo
   BUILD_DIR=${COIN_DIR}/bitcore-build${POSTFIX}
   cp -r bitcore-build${REF_POSTFIX} ${BUILD_DIR}
   cd ${BUILD_DIR}

   # Use function replace
   replacement "BUILD"
fi

# bitcore-message
if [[ $MESSAGE -eq 1 ]] ; then
   # Clone bitcore-message reference repo
   cd ${COIN_DIR}
   git clone https://github.com/TheTrunk/bitcore-message${REF_POSTFIX}.git

   # Copy repo
   MESSAGE_DIR=${COIN_DIR}/bitcore-message${POSTFIX}
   cp -r bitcore-message${REF_POSTFIX} ${MESSAGE_DIR}
   cd ${MESSAGE_DIR}

   # Use function replace
   replacement "MESSAGE"
fi


# Create remote Git Repository
# curl -u dalijolijo https://api.github.com/user/repos -d '{ "name": "bitcore-node-joli" }'

# Push codebase to new Git repository
printf "Do you want to create a new remote GitHub repository?\n"
printf "rm -rf .git\n"
printf "git init\n"
printf "git add .\n"
printf 'git commit -m "inital commit"\n'
printf "git remote add origin https://github.com/dalijolijo/bitcore-node-joli.git\n"
printf "git push -u origin master\n"
