# pycoin-help

## Useful links
* https://github.com/richardkiss/pycoin
* https://github.com/richardkiss/pycoin/blob/master/COMMAND-LINE-TOOLS.md
* http://pycoin.readthedocs.io/en/latest/
* https://iancoleman.io/bip39/

## Installation on Ubuntu 16.04

```sh
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
