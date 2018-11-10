# btcpyserver-help

## links
https://github.com/btcpayserver/btcpayserver-docker
https://github.com/btcpayserver/btcpayserver-docker#how-can-i-add-an-altcoin-to-btcpayserver
https://github.com/btcpayserver/btcpayserver-doc/blob/master/ChangeDomain.md
https://medium.com/@BtcpayServer/hosting-btcpay-server-for-cheap-2b27761fdb9d
https://hub.docker.com/u/nicolasdorier/

## BTX
Dockerfile: https://github.com/dalijolijo/btcpayserver-docker-bitcore

### Test with docker-bitcore
Repo: https://github.com/dalijolijo/btcpayserver-docker

```sh
export BTCPAYGEN_DOCKER_IMAGE="btcpayserver/docker-compose-generator:local"
export BTCPAY_HOST=efd87f2d-fcb7-4ae3-b102-ad4586880eb6.pub.cloud.scaleway.com
export BTCPAYGEN_CRYPTO1="btc"
export BTCPAYGEN_CRYPTO2="btx"
export BTCPAYGEN_ADDITIONAL_FRAGMENTS="opt-save-storage-xxs"
./build.sh
. btcpay-setup.sh -i
```
