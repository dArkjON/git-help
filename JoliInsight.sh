#bin/bash
#
# LIMXTEC - dalijolijo (2018)
#
#set -x

###############
# Set targets #
###############
NODE="0"
API="0"
UI="0"
LIB="0"
BUILD="0"
MESSAGE="0"
WALLET_SERVICE="0"
DOCKER_BUILD="1"


########################
# Select Coin          #
#                      # 
# BitCore: btx         #
# BitCloud: btdx       #
# BitSend: bsd         #
# MegaCoin: mec        #
#                      #
########################
SELECT_COIN="mec"

SELECT_GIT="LIMXTEC"
DEPLOY_GIT="LIMXTEC"
DEPLOY_DOCKER="limxtec" #lower case

#########################
# Team / Author Details # 
########################
TEAM_NAME="The MegaCoin MEC Core Developers"
AUTHOR_NAME="dalijolijo"
AUTHOR_EMAIL="david.bergen@gmx.net"
CREATE_YEAR="2018"

####################
# Coin Details     #
####################

# Netzwork Parameter
# ------------------
# pubkeyhash - The publickey hash prefix
# privatekey - The privatekey prefix
# scripthash - The scripthash prefix
# xpubkey - The extended public key magic
# xprivkey - The extended private key magic
# zaddr - The Coin payment address prefix
# zkey - The Coin spending key prefix
# networkMagic - The network magic number
# port - The network RPC port
# dnsSeeds - An array of dns seeds

# BitCore (BTX)
if [[ $SELECT_COIN == "btx" ]] ; then
   COIN_NAME_1="BitCore"
   COIN_NAME_2="Bitcore"
   COIN_NAME_3="bitcore"
   COIN_NAME_4="BITCORE"
   COIN_1="BTX"
   COIN_2="btx"
   COIN_SOURCE="github.com/LIMXTEC/BitCore.git" # without https:// or http:// and with .git
   COIN_SOURCE_BRANCH="0.15"
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
   MAIN_PUBKEYHASH="0x03"
   MAIN_PRIVKEY="0x80"
   MAIN_SCRIPTHASH="0x7d"
   MAIN_XPUBKEY="0x0488b21e"
   MAIN_XPRIVKEY="0x0488ade4"
   MAIN_ZADDR="no"
   MAIN_ZKEY="no"
   MAIN_NETMAGIC="0xf9beb4d9"
   MAIN_DNSSEED="'37.120.190.76','185.194.140.60','188.71.223.206','37.120.190.76'"
   MAIN_DEFAULT_PORT="8555"
   MAIN_RPC_PORT="8556"
   MAIN_TOR_PORT="9051"
   MAIN_INSIGHT=""
   TEST_PUBKEYHASH="0x6f"
   TEST_PRIVKEY="0xef"
   TEST_SCRIPTHASH="0xc4"
   TEST_XPUBKEY="0x043587cf"
   TEST_XPRIVKEY="0x04358394"
   TEST_ZADDR="no"
   TEST_ZKEY="no"
   TEST_NETMAGIC="0xfdd2c8f1"
   TEST_DNSSEED="'37.120.186.85','51.15.84.165','212.47.246.150'"
   TEST_DEFAULT_PORT="8666"
   TEST_RPC_PORT="50332"
   TEST_TOR_PORT="9051"
   TEST_INSIGHT=""
   WEB="https://bitcore.cc"
   BOOTSTRAP_WEB="bitcore.cc" # without "https://" and without the last "/" (only HTTPS accepted)
   BOOTSTRAP_FILE="bootstrap.tar.gz"
   TICKER="https://api.coinmarketcap.com/v1/ticker/bitcore/"
   LOGO_LINK="https://insight.bitcore.cc/img/Bitcore-logo-135x135.png"
   LOGO_NAME="btx-logo.png"
   COIN_TEXT='BitCore is a peer-to-peer Internet currency that enables instant, near-zero cost payments to anyone in the world. BitCore is an <a href="https://github.com/LIMXTEC/BitCore.git" target="_blank">open-source</a>, global payment network that is fully decentralized. Mathematics secures the network and empowers individuals to control their own finances.' # HTML Text inside <p> ... </p>
   COIN_COLOR='\033[1;35m' # escaping symbol '\\'
   COIN_COMPILE="./autogen.sh \&\& ./configure --disable-dependency-tracking --enable-tests=no --without-gui --disable-hardening \&\& make" # escping symbol '/&'
fi

# BitCloud (BTDX)
if [[ $SELECT_COIN == "btdx" ]] ; then
   COIN_NAME_1="BitCloud"
   COIN_NAME_2="Bitcloud"
   COIN_NAME_3="bitcloud"
   COIN_NAME_4="BITCLOUD"
   COIN_1="BTDX"
   COIN_2="btdx"
   COIN_SOURCE="github.com/LIMXTEC/Bitcloud.git" # without https:// or http:// and with .git
   COIN_SOURCE_BRANCH="master"
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
   MAIN_PUBKEYHASH="0x19"
   MAIN_PRIVKEY="0x99"
   MAIN_SCRIPTHASH="0x05"
   MAIN_XPUBKEY="0x0488b21e"
   MAIN_XPRIVKEY="0x0488ade4"
   MAIN_ZADDR="no"
   MAIN_ZKEY="no"
   MAIN_NETMAGIC="0xe4e8bdfd"
   MAIN_DNSSEED="'188.68.52.172','37.120.186.85','37.120.190.76'"
   MAIN_DEFAULT_PORT="8329"
   MAIN_RPC_PORT="8330"
   MAIN_TOR_PORT="9050"
   TEST_PUBKEYHASH="0x8b"
   TEST_PRIVKEY="0xef"
   TEST_SCRIPTHASH="0x13"
   TEST_XPUBKEY="0x3a8061a0"
   TEST_XPRIVKEY="0x3a805837"
   TEST_ZADDR="no"
   TEST_ZKEY="no"
   TEST_NETMAGIC="0x457665ba"
   TEST_DNSSEED="'188.68.52.172','37.120.186.85','37.120.190.76'"
   TEST_DEFAULT_PORT="51474"
   TEST_RPC_PORT="8329"
   TEST_TOR_PORT="9050"
   WEB="https://bit-cloud.info"
   BOOTSTRAP_WEB="bit-cloud.info/files" # without "https://" and without the last "/" (only HTTPS accepted)
   BOOTSTRAP_FILE="bootstrap.tar.gz"
   TICKER="https://api.coinmarketcap.com/v1/ticker/bitcloud/"
   LOGO_LINK="https://chainz.cryptoid.info/logo/btdx.png"
   LOGO_NAME="btdx-logo.png"
   COIN_TEXT='BitCloud is a peer-to-peer Internet currency that enables instant, near-zero cost payments to anyone in the world. BitCloud is an <a href="https://github.com/LIMXTEC/Bitcloud.git" target="_blank">open-source</a>, global payment network that is fully decentralized. Mathematics secures the network and empowers individuals to control their own finances.' # HTML Text inside <p> ... </p>
   COIN_COLOR='"\\033[0;36m' # escaping symbol '\\'
   COIN_COMPILE="./autogen.sh \&\& ./configure --disable-dependency-tracking --enable-tests=no --without-gui \&\& make"  # escping symbol '/&'
fi

# BitSend (BSD)
if [[ $SELECT_COIN == "bsd" ]] ; then
   COIN_NAME_1="BitSend"
   COIN_NAME_2="Bitsend"
   COIN_NAME_3="bitsend"
   COIN_NAME_4="BITSEND"
   COIN_1="BSD"
   COIN_2="bsd"
   COIN_SOURCE="github.com/LIMXTEC/BitSend.git" # without https:// or http:// and with .git
   COIN_SOURCE_BRANCH="Insight-Patch-0_14"
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
   MAIN_PUBKEYHASH="0x66"
   MAIN_PRIVKEY="0xcc"
   MAIN_SCRIPTHASH="0x05"
   MAIN_XPUBKEY="0x0488b21e"
   MAIN_XPRIVKEY="0x0488ade4"
   MAIN_ZADDR="no"
   MAIN_ZKEY="no"
   MAIN_NETMAGIC="0xa3d5c2f9"
   MAIN_DNSSEED="'188.68.52.172','37.120.186.85','37.120.190.76','213.136.80.93','213.136.86.202','213.136.86.205','213.136.86.207'"
   MAIN_DEFAULT_PORT="8886"
   MAIN_RPC_PORT="8800"
   MAIN_TOR_PORT="9051"
   MAIN_INSIGHT=""
   TEST_PUBKEYHASH="0x6f"
   TEST_PRIVKEY="0xef"
   TEST_SCRIPTHASH="0xc4"
   TEST_XPUBKEY="0x043587cf"
   TEST_XPRIVKEY="0x04358394"
   TEST_ZADDR="no"
   TEST_ZKEY="no"
   TEST_NETMAGIC="0x0b110907"
   TEST_DNSSEED="'testnet-seed.bitsend.jonasschnelli.ch','seed.tbtc.petertodd.org','testnet-seed.bluematt.me','testnet-seed.bitsend.schildbach.de'"
   TEST_DEFAULT_PORT="18333"
   TEST_RPC_PORT="18800"
   TEST_TOR_PORT="9051"
   TEST_INSIGHT=""
   WEB="https://bitsend.info"
   BOOTSTRAP_WEB="www.mybitsend.com" # without "https://" and without the last "/" (only HTTPS accepted)
   BOOTSTRAP_FILE="bootstrap.tar.gz"
   TICKER="https://api.coinmarketcap.com/v1/ticker/bitsend/"
   LOGO_LINK="https://chainz.cryptoid.info/logo/bsd.png"
   LOGO_NAME="bsd-logo.png"
   COIN_TEXT='BitSend is a peer-to-peer Internet currency that enables instant, near-zero cost payments to anyone in the world. BitSend is an <a href="https://github.com/LIMXTEC/BitSend.git" target="_blank">open-source</a>, global payment network that is fully decentralized. Mathematics secures the network and empowers individuals to control their own finances.' # HTML Text inside <p> ... </p>
   COIN_COLOR='\\033[0;34m' # escaping symbol '\\'
   COIN_COMPILE="./autogen.sh \&\& ./configure --disable-dependency-tracking --enable-tests=no --without-gui \&\& make" # escping symbol '/&'
fi

# MegaCoin (MEC)
if [[ $SELECT_COIN == "mec" ]] ; then
   COIN_NAME_1="MegaCoin"
   COIN_NAME_2="Megacoin"
   COIN_NAME_3="megacoin"
   COIN_NAME_4="MEGACOIN"
   COIN_1="MEC"
   COIN_2="mec"
   COIN_SOURCE="github.com/LIMXTEC/Megacoin.git" # without https:// or http:// and with .git
   COIN_SOURCE_BRANCH="addindex"
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
   MAIN_PUBKEYHASH="0x32"
   MAIN_PRIVKEY="0xb2"
   MAIN_SCRIPTHASH="0x05"
   MAIN_XPUBKEY="0x0488b21e"
   MAIN_XPRIVKEY="0x0488ade4"
   MAIN_ZADDR="no"
   MAIN_ZKEY="no"
   MAIN_NETMAGIC="0xede0e4ee"
   MAIN_DNSSEED="'185.194.142.125','185.194.140.60'"
   MAIN_DEFAULT_PORT="7951"
   MAIN_RPC_PORT="7952"
   MAIN_TOR_PORT="9051"
   MAIN_INSIGHT=""
   TEST_PUBKEYHASH="0x6f"
   TEST_PRIVKEY="0xef"
   TEST_SCRIPTHASH="0xc4"
   TEST_XPUBKEY="0x043587cf"
   TEST_XPRIVKEY="0x04358394"
   TEST_ZADDR="no"
   TEST_ZKEY="no"
   TEST_NETMAGIC="0xfdf0f4fe"
   TEST_DNSSEED="'108.61.179.50'"
   TEST_DEFAULT_PORT="19444"
   TEST_RPC_PORT="50732"
   TEST_TOR_PORT="9051"
   TEST_INSIGHT=""
   WEB="https://www.megacoin.eu" 
   BOOTSTRAP_WEB="megacoin.eu/downloads" # without "https://" and without the last "/" (only HTTPS accepted)
   BOOTSTRAP_FILE="bootstrap.tar.gz"
   TICKER="https://api.coinmarketcap.com/v1/ticker/megacoin/"
   LOGO_LINK="https://chainz.cryptoid.info/logo/mec.png"
   LOGO_NAME="mec-logo.png"
   COIN_TEXT='MegaCoin is a peer-to-peer Internet currency that enables instant, near-zero cost payments to anyone in the world. MegaCoin is an <a href="https://github.com/LIMXTEC/Megacoin.git" target="_blank">open-source</a>, global payment network that is fully decentralized. Mathematics secures the network and empowers individuals to control their own finances.' # HTML Text inside <p> ... </p>
   COIN_COLOR='\\033[1;31m' # escaping symbol '\\'
   COIN_COMPILE="./autogen.sh \&\& ./configure --disable-dependency-tracking --enable-tests=no --without-gui --disable-hardening \&\& make" # escping symbol '/&'
fi

# Reference project variables
REF_COIN_NAME_1="JoliCoin"
REF_COIN_NAME_2="Jolicoin"
REF_COIN_NAME_3="jolicoin"
REF_COIN_NAME_4="J_O_L_I_COIN"
REF_COIN_1="JOLI"
REF_COIN_2="j_o_l_i"
REF_GIT="dalijolijo"
REF_DEPLOY_DOCKER="J_O_L_I_DOCKER"
REF_COIN_SOURCE="J_O_L_I_SOURCE"
REF_COIN_SRC_DIR="J_O_L_I_SRC_DIR"
REF_COIN_SOURCE_BRANCH="J_O_L_I_SRC_BRANCH"
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
REF_MAIN_PUBKEYHASH="J_O_L_I_PUBKEYHASH"
REF_MAIN_PRIVKEY="J_O_L_I_PRIVKEY"
REF_MAIN_SCRIPTHASH="J_O_L_I_SCRIPTHASH"
REF_MAIN_XPUBKEY="J_O_L_I_XPUBKEY"
REF_MAIN_XPRIVKEY="J_O_L_I_XPRIVKEY"
REF_MAIN_ZADDR="J_O_L_I_ZADDR"
REF_MAIN_ZKEY="J_O_L_I_ZKEY"
REF_MAIN_NETMAGIC="J_O_L_I_NETMAGIC"
REF_MAIN_DNSSEED="J_O_L_I_DNSSEED"
REF_MAIN_DEFAULT_PORT="J_O_L_I_DEFAULTPORT"
REF_MAIN_RPC_PORT="J_O_L_I_RPCPORT"
REF_MAIN_TOR_PORT="J_O_L_I_TORPORT"
REF_MAIN_INSIGHT="J_O_L_I_MAIN_INSIGHT"
REF_TEST_PUBKEYHASH="J_O_L_I_TEST_PUBKEYHASH"
REF_TEST_PRIVKEY="J_O_L_I_TEST_PRIVKEY"
REF_TEST_SCRIPTHASH="J_O_L_I_TEST_SCRIPTHASH"
REF_TEST_XPUBKEY="J_O_L_I_TEST_XPUBKEY"
REF_TEST_XPRIVKEY="J_O_L_I_TEST_XPRIVKEY"
REF_TEST_ZADDR="J_O_L_I_TEST_ZADDR"
REF_TEST_ZKEY="J_O_L_I_TEST_ZKEY"
REF_TEST_NETMAGIC="J_O_L_I_TEST_NETMAGIC"
REF_TEST_DNSSEED="J_O_L_I_TEST_DNSSEED"
REF_TEST_DEFAULT_PORT="J_O_L_I_TEST_DEFAULTPORT"
REF_TEST_RPC_PORT="J_O_L_I_TEST_RPCPORT"
REF_TEST_TOR_PORT="J_O_L_I_TEST_TORPORT"
REF_TEST_INSIGHT="J_O_L_I_TEST_INSIGHT"
REF_WEB="https://jolicoin.cc"
REF_BOOTSTRAP_WEB="J_O_L_I_BOOTSTRAP_WEB"
REF_BOOTSTRAP_FILE="J_O_L_I_BOOTSTRAP_FILE"
REF_TICKER="https://api.coinmarketcap.com/v1/ticker/jolicoin/"
REF_LOGO_NAME="joli-logo.png"
REF_COIN_TEXT="J_O_L_I_TEXT"
REF_COIN_COLOR="J_O_L_I_COLOR"
REF_TEAM_NAME="J_O_L_I_TEAM"
REF_AUTHOR_NAME="J_O_L_I_AUTHOR"
REF_AUTHOR_EMAIL="J_O_L_I_EMAIL"
REF_CREATE_YEAR="J_O_L_I_YEAR"
REF_COIN_COMPILE="J_O_L_I_COMPILE"

function replacement () {
   # Delete log files
   rm npm-debug.log

   # Replace Coin Abbreviation
   grep -rl "${REF_COIN_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_1}/${COIN_1}/g"
   grep -rl "${REF_COIN_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_2}/${COIN_2}/g"

   # Replace Git Repository
   grep -rl "${REF_GIT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_GIT}/${SELECT_GIT}/g"

   # Replace Homepage Link
   grep -rl "${REF_WEB}" ./ | grep -v '.git' | xargs sed -i "s|${REF_WEB}|${WEB}|g"

   # Replace Price Ticker API Link
   grep -rl "${REF_TICKER}" ./ | grep -v '.git' | xargs sed -i "s|${REF_TICKER}|${TICKER}|g"

   # Replace Coin Source Link

   grep -rl "${REF_COIN_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s|${REF_COIN_SOURCE}|${COIN_SOURCE}|g"

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
      sed -i "s/${REF_MAIN_RPC_PORT}/${MAIN_RPC_PORT}/g" "${NODE_DIR}/lib/services/bitcoind.js"
      sed -i "s/${REF_TEST_RPC_PORT}/${TEST_RPC_PORT}/g" "${NODE_DIR}/lib/services/bitcoind.js"
   fi

   # Replace Coin Name
   grep -rl "${REF_COIN_NAME_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_1}/${COIN_NAME_1}/g"
   grep -rl "${REF_COIN_NAME_2}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_2}/${COIN_NAME_2}/g"
   grep -rl "${REF_COIN_NAME_3}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_3}/${COIN_NAME_3}/g"
   grep -rl "${REF_COIN_NAME_4}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_NAME_4}/${COIN_NAME_4}/g"

   if [[ $1 == "UI" ]] ; then
      # Rename directory
      mv ${UI_DIR}/bitcore-node${REF_POSTFIX} ${UI_DIR}/bitcore-node${POSTFIX}

      # Replace Coin Description
      sed -i "s|${REF_COIN_TEXT}|${COIN_TEXT}|g" "${UI_DIR}/public/views/index.html"

      # Copy logo to public/img/ and public/views/img/
      curl -o ${UI_DIR}/public/img/${LOGO_NAME} ${LOGO_LINK}
      cp ${UI_DIR}/public/img/${LOGO_NAME} ${UI_DIR}/public/views/img/${LOGO_NAME} 
   fi

   if [[ $1 == "LIB" ]] ; then
      # Replace network parameters 
      sed -i "s/${REF_MAIN_PUBKEYHASH}/${MAIN_PUBKEYHASH}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_MAIN_PRIVKEY}/${MAIN_PRIVKEY}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_MAIN_SCRIPTHASH}/${MAIN_SCRIPTHASH}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_MAIN_XPUBKEY}/${MAIN_XPUBKEY}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_MAIN_XPRIVKEY}/${MAIN_XPRIVKEY}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_MAIN_NETMAGIC}/${MAIN_NETMAGIC}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_MAIN_DNSSEED}/${MAIN_DNSSEED}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_MAIN_DEFAULT_PORT}/${MAIN_DEFAULT_PORT}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_TEST_PUBKEYHASH}/${TEST_PUBKEYHASH}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_TEST_PRIVKEY}/${TEST_PRIVKEY}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_TEST_SCRIPTHASH}/${TEST_SCRIPTHASH}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_TEST_XPUBKEY}/${TEST_XPUBKEY}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_TEST_XPRIVKEY}/${TEST_XPRIVKEY}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_TEST_NETMAGIC}/${TEST_NETMAGIC}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_TEST_DNSSEED}/${TEST_DNSSEED}/g" "${LIB_DIR}/lib/networks.js"
      sed -i "s/${REF_TEST_DEFAULT_PORT}/${TEST_DEFAULT_PORT}/g" "${LIB_DIR}/lib/networks.js"


      if [[ $MAIN_ZADDR == "no" ]] ; then
         sed -i "s|zaddr: ${REF_MAIN_ZADDR},|//zaddr: not needed|g" "${LIB_DIR}/lib/networks.js"
         sed -i "s|zkey: ${REF_MAIN_ZKEY},|//zkey: not needed|g" "${LIB_DIR}/lib/networks.js"
         sed -i "s|zaddr: ${REF_TEST_ZADDR},|//zaddr: not needed|g" "${LIB_DIR}/lib/networks.js"
         sed -i "s|zkey: ${REF_TEST_ZKEY},|//zkey: not needed|g" "${LIB_DIR}/lib/networks.js"
      else
         sed -i "s/${REF_MAIN_ZADDR}/${MAIN_ZADDR}/g" "${LIB_DIR}/lib/networks.js"
         sed -i "s/${REF_MAIN_ZKEY}/${MAIN_ZKEY}/g" "${LIB_DIR}/lib/networks.js"
         sed -i "s/${REF_TEST_ZADDR}/${TEST_ZADDR}/g" "${LIB_DIR}/lib/networks.js"
         sed -i "s/${REF_TEST_ZKEY}/${TEST_ZKEY}/g" "${LIB_DIR}/lib/networks.js"
      fi
   fi

   if [[ $1 == "DOCKER" ]] ; then
      # Rename docker script
      mv ${DOCKER_DIR}/${REF_COIN_2}-insight-docker.sh ${DOCKER_DIR}/${COIN_2}-insight-docker.sh
      
      # Replace compilation process
      COIN_SRC_DIR=$(echo ${COIN_SOURCE} | grep -oE "[^/]+$" | cut -d. -f1)
      grep -rl "${REF_COIN_SOURCE_BRANCH}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_SOURCE_BRANCH}/${COIN_SOURCE_BRANCH}/g"
      grep -rl "${REF_COIN_SRC_DIR}" ./ | grep -v '.git' | xargs sed -i "s/${REF_COIN_SRC_DIR}/${COIN_SRC_DIR}/g"
      grep -rl "${REF_COIN_SOURCE}" ./ | grep -v '.git' | xargs sed -i "s|${REF_COIN_SOURCE}|${COIN_SOURCE}|g"
      grep -rl "${REF_COIN_COMPILE}" ./ | grep -v '.git' | xargs sed -i "s|${REF_COIN_COMPILE}|${COIN_COMPILE}|g"
      grep -rl "${REF_DAEMON_1}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DAEMON_1}/${DAEMON_1}/g"
      grep -rl "${REF_BOOTSTRAP_WEB}" ./ | grep -v '.git' | xargs sed -i "s/${REF_BOOTSTRAP_WEB}/${BOOTSTRAP_WEB}/g"
      grep -rl "${REF_BOOTSTRAP_FILE}" ./ | grep -v '.git' | xargs sed -i "s/${REF_BOOTSTRAP_FILE}/${BOOTSTRAP_FILE}/g"
      
      # Replace Port settings
      grep -rl "${REF_MAIN_DEFAULT_PORT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_MAIN_DEFAULT_PORT}/${MAIN_DEFAULT_PORT}/g"
      grep -rl "${REF_MAIN_RPC_PORT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_MAIN_RPC_PORT}/${MAIN_RPC_PORT}/g"  
      grep -rl "${REF_MAIN_TOR_PORT}" ./ | grep -v '.git' | xargs sed -i "s/${REF_MAIN_TOR_PORT}/${MAIN_TOR_PORT}/g"

      # Replace Coin Setting
      grep -rl "${REF_COIN_COLOR}" ./ | grep -v '.git' | xargs sed -i "s|${REF_COIN_COLOR}|${COIN_COLOR}|g"
   fi

   # Add Team/Author Details
   grep -rl "${REF_DEPLOY_DOCKER}" ./ | grep -v '.git' | xargs sed -i "s/${REF_DEPLOY_DOCKER}/${DEPLOY_DOCKER}/g"
   grep -rl "${REF_TEAM_NAME}" ./ | grep -v '.git' | xargs sed -i "s/${REF_TEAM_NAME}/${TEAM_NAME}/g"
   grep -rl "${REF_AUTHOR_NAME}" ./ | grep -v '.git' | xargs sed -i "s/${REF_AUTHOR_NAME}/${AUTHOR_NAME}/g"
   grep -rl "${REF_AUTHOR_EMAIL}" ./ | grep -v '.git' | xargs sed -i "s/${REF_AUTHOR_EMAIL}/${AUTHOR_EMAIL}/g"
   grep -rl "${REF_CREATE_YEAR}" ./ | grep -v '.git' | xargs sed -i "s/${REF_CREATE_YEAR}/${CREATE_YEAR}/g"
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

   # Create remote GitHub Repository
   printf "Do you want to create a new remote GitHub repository bitcore-node${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read NODE_NEW_GIT
   if [[ $NODE_NEW_GIT =~ "Y" ]] || [[ $NODE_NEW_GIT =~ "y" ]]; then
      # Create new remote Git repository and push code
      if [[ $DEPLOY_GIT == "LIMXTEC" ]]; then
          curl -u ${REF_GIT} https://api.github.com/orgs/${DEPLOY_GIT}/repos -d "{ \"name\": \"bitcore-node${POSTFIX}\" }"
      else
          curl -u ${REF_GIT} https://api.github.com/user/repos -d "{ \"name\": \"bitcore-node${POSTFIX}\" }"
      fi
   fi

   # Push to remote GitHub Repository
   printf "Do you want to push to remote GitHub repository bitcore-node${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read NODE_PUSH_GIT
   if [[ $NODE_PUSH_GIT =~ "Y" ]] || [[ $NODE_PUSH_GIT =~ "y" ]]; then
      cd ${NODE_DIR}
      rm -rf .git
      git init
      git add .
      git commit -m "inital commit"
      git remote add origin https://github.com/${DEPLOY_GIT}/bitcore-node${POSTFIX}.git
      git push -u origin master
   fi
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

   # Create remote GitHub Repository
   printf "Do you want to create a new remote GitHub repository insight-api${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read API_NEW_GIT
   if [[ $API_NEW_GIT =~ "Y" ]] || [[ $API_NEW_GIT =~ "y" ]]; then
      # Create new remote Git repository and push code
      if [[ $DEPLOY_GIT == "LIMXTEC" ]]; then
          curl -u ${REF_GIT} https://api.github.com/orgs/${DEPLOY_GIT}/repos -d "{ \"name\": \"insight-api${POSTFIX}\" }"
      else
          curl -u ${REF_GIT} https://api.github.com/user/repos -d "{ \"name\": \"insight-api${POSTFIX}\" }"
      fi
   fi

   # Push to remote GitHub Repository
   printf "Do you want to push to remote GitHub repository insight-api${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read API_PUSH_GIT
   if [[ $API_PUSH_GIT =~ "Y" ]] || [[ $API_PUSH_GIT =~ "y" ]]; then
      cd ${API_DIR}
      rm -rf .git
      git init
      git add .
      git commit -m "inital commit"
      git remote add origin https://github.com/${DEPLOY_GIT}/insight-api${POSTFIX}.git
      git push -u origin master
   fi
fi

# insight-ui
if [[ $UI -eq 1 ]] ; then
   # Clone insight-ui reference repo
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/insight-ui${REF_POSTFIX}.git

   # Copy repo
   UI_DIR=${COIN_DIR}/insight-ui${POSTFIX}
   cp -r insight-ui${REF_POSTFIX} ${UI_DIR}
   cd ${UI_DIR}

   # Use function replace
   replacement "UI"

   # Create remote GitHub Repository
   printf "Do you want to create a new remote GitHub repository insight-ui${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read UI_NEW_GIT
   if [[ $UI_NEW_GIT =~ "Y" ]] || [[ $UI_NEW_GIT =~ "y" ]]; then
      # Create new remote Git repository and push code
      if [[ $DEPLOY_GIT == "LIMXTEC" ]]; then
          curl -u ${REF_GIT} https://api.github.com/orgs/${DEPLOY_GIT}/repos -d "{ \"name\": \"insight-ui${POSTFIX}\" }"
      else
          curl -u ${REF_GIT} https://api.github.com/user/repos -d "{ \"name\": \"insight-ui${POSTFIX}\" }"
      fi
   fi

   # Push to remote GitHub Repository
   printf "Do you want to push to remote GitHub repository insight-ui${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read UI_PUSH_GIT
   if [[ $UI_PUSH_GIT =~ "Y" ]] || [[ $UI_PUSH_GIT =~ "y" ]]; then
      cd ${UI_DIR}
      rm -rf .git
      git init
      git add .
      git commit -m "inital commit"
      git remote add origin https://github.com/${DEPLOY_GIT}/insight-ui${POSTFIX}.git
      git push -u origin master
   fi
fi

# bitcore-lib
if [[ $LIB -eq 1 ]] ; then
   # Clone bitcore-lib reference repo
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/bitcore-lib${REF_POSTFIX}.git

   # Copy repo
   LIB_DIR=${COIN_DIR}/bitcore-lib${POSTFIX}
   cp -r bitcore-lib${REF_POSTFIX} ${LIB_DIR}
   cd ${LIB_DIR}

   # Use function replace
   replacement "LIB"

   # Create remote GitHub Repository
   printf "Do you want to create a new remote GitHub repository bitcore-lib${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read LIB_NEW_GIT
   if [[ $LIB_NEW_GIT =~ "Y" ]] || [[ $LIB_NEW_GIT =~ "y" ]]; then
      # Create new remote Git repository and push code
      if [[ $DEPLOY_GIT == "LIMXTEC" ]]; then
          curl -u ${REF_GIT} https://api.github.com/orgs/${DEPLOY_GIT}/repos -d "{ \"name\": \"bitcore-lib${POSTFIX}\" }"
      else
          curl -u ${REF_GIT} https://api.github.com/user/repos -d "{ \"name\": \"bitcore-lib${POSTFIX}\" }"
      fi
   fi

   # Push to remote GitHub Repository
   printf "Do you want to push to remote GitHub repository bitcore-lib${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read LIB_PUSH_GIT
   if [[ $LIB_PUSH_GIT =~ "Y" ]] || [[ $LIB_PUSH_GIT =~ "y" ]]; then
      cd ${LIB_DIR}
      rm -rf .git
      git init
      git add .
      git commit -m "inital commit"
      git remote add origin https://github.com/${DEPLOY_GIT}/bitcore-lib${POSTFIX}.git
      git push -u origin master
   fi
fi

# bitcore-build
if [[ $BUILD -eq 1 ]] ; then
   # Clone bitcore-build reference repo
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/bitcore-build${REF_POSTFIX}.git

   # Copy repo
   BUILD_DIR=${COIN_DIR}/bitcore-build${POSTFIX}
   cp -r bitcore-build${REF_POSTFIX} ${BUILD_DIR}
   cd ${BUILD_DIR}

   # Use function replace
   replacement "BUILD"
   # Create remote GitHub Repository
   printf "Do you want to create a new remote GitHub repository bitcore-build${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read BUILD_NEW_GIT
   if [[ $BUILD_NEW_GIT =~ "Y" ]] || [[ $BUILD_NEW_GIT =~ "y" ]]; then
      # Create new remote Git repository and push code
      if [[ $DEPLOY_GIT == "LIMXTEC" ]]; then
          curl -u ${REF_GIT} https://api.github.com/orgs/${DEPLOY_GIT}/repos -d "{ \"name\": \"bitcore-build${POSTFIX}\" }"
      else
         curl -u ${REF_GIT} https://api.github.com/user/repos -d "{ \"name\": \"bitcore-build${POSTFIX}\" }"
      fi
   fi

   # Push to remote GitHub Repository
   printf "Do you want to push to remote GitHub repository bitcore-build${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read BUILD_PUSH_GIT
   if [[ $BUILD_PUSH_GIT =~ "Y" ]] || [[ $BUILD_PUSH_GIT =~ "y" ]]; then
      cd ${BUILD_DIR}
      rm -rf .git
      git init
      git add .
      git commit -m "inital commit"
      git remote add origin https://github.com/${DEPLOY_GIT}/bitcore-build${POSTFIX}.git
      git push -u origin master
   fi
fi

# bitcore-message
if [[ $MESSAGE -eq 1 ]] ; then
   # Clone bitcore-message reference repo
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/bitcore-message${REF_POSTFIX}.git

   # Copy repo
   MESSAGE_DIR=${COIN_DIR}/bitcore-message${POSTFIX}
   cp -r bitcore-message${REF_POSTFIX} ${MESSAGE_DIR}
   cd ${MESSAGE_DIR}

   # Use function replace
   replacement "MESSAGE"

   # Create remote GitHub Repository
   printf "Do you want to create a new remote GitHub repository bitcore-message${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read MESSAGE_NEW_GIT
   if [[ $MESSAGE_NEW_GIT =~ "Y" ]] || [[ $MESSAGE_NEW_GIT =~ "y" ]]; then
      # Create new remote Git repository and push code
      if [[ $DEPLOY_GIT == "LIMXTEC" ]]; then
          curl -u ${REF_GIT} https://api.github.com/orgs/${DEPLOY_GIT}/repos -d "{ \"name\": \"bitcore-message${POSTFIX}\" }"
      else
          curl -u ${REF_GIT} https://api.github.com/user/repos -d "{ \"name\": \"bitcore-message${POSTFIX}\" }"
      fi
   fi

   # Push to remote GitHub Repository
   printf "Do you want to push to remote GitHub repository bitcore-message${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read MESSAGE_PUSH_GIT
   if [[ $MESSAGE_PUSH_GIT =~ "Y" ]] || [[ $MESSAGE_PUSH_GIT =~ "y" ]]; then
      cd ${MESSAGE_DIR}
      rm -rf .git
      git init
      git add .
      git commit -m "inital commit"
      git remote add origin https://github.com/${DEPLOY_GIT}/bitcore-message${POSTFIX}.git
      git push -u origin master
   fi
fi

# bitcore-wallet-service
if [[ $WALLET_SERVICE -eq 1 ]] ; then
   # Clone bitcore-wallet-service reference repo
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/bitcore-wallet-service${REF_POSTFIX}.git

   # Copy repo
   WALLET_SERVICE_DIR=${COIN_DIR}/bitcore-wallet-service${POSTFIX}
   cp -r bitcore-wallet-service${REF_POSTFIX} ${WALLET_SERVICE_DIR}
   cd ${WALLET_SERVICE_DIR}

   # Use function replace
   replacement "WALLET_SERVICE"

   # Create remote GitHub Repository
   printf "Do you want to create a new remote GitHub repository bitcore-wallet-service${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read WALLET_SERVICE_NEW_GIT
   if [[ $WALLET_SERVICE_NEW_GIT =~ "Y" ]] || [[ $WALLET_SERVICE_NEW_GIT =~ "y" ]]; then
      # Create new remote Git repository and push code
      if [[ $DEPLOY_GIT == "LIMXTEC" ]]; then
          curl -u ${REF_GIT} https://api.github.com/orgs/${DEPLOY_GIT}/repos -d "{ \"name\": \"bitcore-wallet-service${POSTFIX}\" }"
      else
          curl -u ${REF_GIT} https://api.github.com/user/repos -d "{ \"name\": \"bitcore-wallet-service${POSTFIX}\" }"
      fi
   fi

   # Push to remote GitHub Repository
   printf "Do you want to push to remote GitHub repository bitcore-wallet-service${POSTFIX} on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read WALLET_SERVICE_PUSH_GIT
   if [[ $WALLET_SERVICE_PUSH_GIT =~ "Y" ]] || [[ $WALLET_SERVICE_PUSH_GIT =~ "y" ]]; then
      cd ${WALLET_SERVICE_DIR}
      rm -rf .git
      git init
      git add .
      git commit -m "inital commit"
      git remote add origin https://github.com/${DEPLOY_GIT}/bitcore-wallet-service${POSTFIX}.git
      git push -u origin master
   fi
fi

# Build Docker Git Repository
if [[ $DOCKER_BUILD -eq 1 ]] ; then
   # Clone JOLIinsight-docker reference repo 
   cd ${COIN_DIR}
   git clone https://github.com/${REF_GIT}/${REF_COIN_1}insight-docker.git

   # Copy repo
   DOCKER_DIR=${COIN_DIR}/${COIN_1}insight-docker
   cp -r ${REF_COIN_1}insight-docker ${DOCKER_DIR}
   cd ${DOCKER_DIR}

   # Use function replace
   replacement "DOCKER"

   # Create remote GitHub Repository
   printf "Do you want to create a new remote GitHub repository ${COIN_1}insight-docker on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read DOCKER_NEW_GIT
   if [[ $DOCKER_NEW_GIT =~ "Y" ]] || [[ $DOCKER_NEW_GIT =~ "y" ]]; then
      # Create new remote Git repository and push code
      if [[ $DEPLOY_GIT == "LIMXTEC" ]]; then
          curl -u ${REF_GIT} https://api.github.com/orgs/${DEPLOY_GIT}/repos -d "{ \"name\": \"${COIN_1}insight-docker\" }"
      else
          curl -u ${REF_GIT} https://api.github.com/user/repos -d "{ \"name\": \"${COIN_1}insight-docker\" }"
      fi
   fi

   # Push to remote GitHub Repository
   printf "Do you want to push to remote GitHub repository ${COIN_1}insight-docker on ${DEPLOY_GIT}?\n"
   printf "Enter [Y]es or [N]o and Hit [ENTER]: "
   read DOCKER_PUSH_GIT
   if [[ $DOCKER_PUSH_GIT =~ "Y" ]] || [[ $DOCKER_PUSH_GIT =~ "y" ]]; then
      cd ${DOCKER_DIR}
      rm -rf .git
      git init
      git add .
      git commit -m "inital commit"
      git remote add origin https://github.com/${DEPLOY_GIT}/${COIN_1}insight-docker.git
      git push -u origin master
   fi
fi

