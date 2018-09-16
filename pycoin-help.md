# pycoin-help

## Useful links
* https://github.com/richardkiss/pycoin
* https://github.com/richardkiss/pycoin/blob/master/COMMAND-LINE-TOOLS.md
* http://pycoin.readthedocs.io/en/latest/
* https://iancoleman.io/bip39/

## Installation on Ubuntu 16.04

```sh
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
apt-get install python3.5 python3.6 pypy

make
python setup.py --help-commands
python setup.py build
python setup.py install
python setup.py check
python setup.py test
python setup.py install_egg_info
``` 

## Testing

To avoid the following error:
> Not enough random bytes available.Please do some other work to give the OS a chance to collect more entropy!

See solution here: https://linux-audit.com/gpg-key-generation-not-enough-random-bytes-available/
```sh
apt-get install rng-tools

Open new bash console and execute rngd
rngd -f -r /dev/urandom
```

Run test to check the code base:
```sh
pip install tox
./test.sh
```

## Naming
Compare naming on http://bip32.org/ with naming of Crypto coin utility ku ("key utility").

* BIP32 Extended Key = wallet_key
* Depth = tree_depth
* Key = Private Key (WIF) = wif
* Derivation Path: Info m = ``-s 0H/0/0/0`` 
* Derived Public Key = public_version
* Public Key (Hex) = key_pair_as_sec
* Address = address

Use wallet_key (= BIP32 Extended Key) as input check on http://bip32.org/
