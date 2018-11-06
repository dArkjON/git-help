# btcpyserver-help

## links
https://github.com/btcpayserver/btcpayserver-docker#how-can-i-add-an-altcoin-to-btcpayserver
https://medium.com/@BtcpayServer/hosting-btcpay-server-for-cheap-2b27761fdb9d

## BTX
Dockerfile: https://github.com/dalijolijo/btcpayserver-docker-bitcore

### Test with docker-bitcore
Repo: https://github.com/dalijolijo/btcpayserver-docker

```sh
cd docker-compose-generator
export BTCPAYGEN_DOCKER_IMAGE="btcpayserver/docker-compose-generator:local"
cd ..
export BTCPAY_HOST=efd87f2d-fcb7-4ae3-b102-ad4586880eb6.pub.cloud.scaleway.com
export BTCPAYGEN_CRYPTO1="btc"
export BTCPAYGEN_CRYPTO2="btx"
export BTCPAYGEN_ADDITIONAL_FRAGMENTS="opt-save-storage-xxs"
./build.sh
. btcpay-setup.sh -i
```
