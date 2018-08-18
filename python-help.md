# python-help

## For Python 2.7

### Installation needed packages (for Ubuntu 16.04)
```sh
apt-get install python-pip
pip2 install --upgrade pip
python -m pip list
python -m pip install setuptools wheel twine
```

### Generate python package
```sh
python setup.py sdist bdist_wheel
```

### Uploading the distribution archives
Go to directory where setup.py is located
```sh
twine upload dist/*
```

### Installing your newly uploaded package
```sh
pip install NEW_PKG
```

### Deinstallation
```sh
pip uninstall NEW_PKG
rm -rf NEW_PKG.egg-info build dist
```
