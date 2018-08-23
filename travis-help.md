# travis-help

## Publish to GitHub

### Install Travis Client
```sh
sudo apt-get install ruby-dev
```

### Generate secure API key
See https://docs.travis-ci.com/user/encryption-keys/

```sh
gem install travis
/usr/local/bin/travis encrypt SOMEVAR="<My GitHub API Key>"
Shell completion not installed. Would you like to install it now? |y| y
Detected repository as dalijolijo/BitCore, is this correct? |yes| yes
Please add the following to your .travis.yml file:
  secure: 
  qYnoa+JrpVms4Cno+oOo3j+c7GOwRPnZYWNCFRLvCN5Kzje/r+zjVhl6GKTHeTBDjdIKSkJgoPF0p+GYK8iwdUWg6jIm9ccdRJzz69u14u/mSpDO6YJ6iVDE7V0iYJEp5xOf1zeyPhJ0EYqYMcChoD11+nceVYaT16j3YRT1j+gV+P86p80eZWHGacjAb6TM1PAWH4Ooxx958jSitUmPKntQ05kK8Ly3d0WsyDtitRf6DbLEkXemMfTUgr4kdWcLum4KRuhqIiUJtQL8R6JqFKH/TN2pbiNNzgX2N4RwKabQbfwuVDsRZMRnkfLFXPzJhwoplk171XvrSVEmy2aY4smcbIEq6eS1HJ9p7B0pfF33EnLxvyACza6z/CPrbw7H99uRfue2Y4IdAjn+UhluaXne3KaK7UZCbuC454pywRasXqWzaNQhinlNGXUBYE4CVZzSvL9mpXPxeIh87cMnQEL5GSA+444Q6iUx7tUxfaeE2kfi80v9L94BlU2i/1LiiKMFNihfeXxGqZqTW34NIhnL5Ze8DlPaC8pQl79lZfxmlyRpbLnueYuaRl4apxA0G2IlY+BxZreAJPhE24KT1m2FEcGjvgJYP1iIsFx2UJvezMAS8t1dD9QdtAeCFWgkIiUDSluYn47/8RP/IOutez7yluG5Eq+FVClZOXCmU2I= 
Pro Tip: You can add it automatically by running with --add.
```

### Modify .travis to publish binaries
See https://docs.travis-ci.com/user/deployment/releases/

#### Alternative 1:
```sh
before_deploy:
      # Set up git user name and tag this commit
      - git config --local user.name "dalijolijo"
      - git config --local user.email "david.bergen@gmx.net"
      - git tag "$(date +'%Y%m%d%H%M%S')-$(git log --format=%h -1)"
deploy:
      provider: releases
      api_key: 
         secure: ...
      file_glob: true
      file: out/**/zip/*
      skip_cleanup: true
```

#### Alternative 2:
```sh
deploy:
      provider: releases
      api_key:
        secure: qYnoa+JrpVms4Cno+oOo3j+c7GOwRPnZYWNCFRLvCN5Kzje/r+zjVhl6GKTHeTBDjdIKSkJgoPF0p+GYK8iwdUWg6jIm9ccdRJzz69u14u/mSpDO6YJ6iVDE7V0iYJEp5xOf1zeyPhJ0EYqYMcChoD11+nceVYaT16j3YRT1j+gV+P86p80eZWHGacjAb6TM1PAWH4Ooxx958jSitUmPKntQ05kK8Ly3d0WsyDtitRf6DbLEkXemMfTUgr4kdWcLum4KRuhqIiUJtQL8R6JqFKH/TN2pbiNNzgX2N4RwKabQbfwuVDsRZMRnkfLFXPzJhwoplk171XvrSVEmy2aY4smcbIEq6eS1HJ9p7B0pfF33EnLxvyACza6z/CPrbw7H99uRfue2Y4IdAjn+UhluaXne3KaK7UZCbuC454pywRasXqWzaNQhinlNGXUBYE4CVZzSvL9mpXPxeIh87cMnQEL5GSA+444Q6iUx7tUxfaeE2kfi80v9L94BlU2i/1LiiKMFNihfeXxGqZqTW34NIhnL5Ze8DlPaC8pQl79lZfxmlyRpbLnueYuaRl4apxA0G2IlY+BxZreAJPhE24KT1m2FEcGjvgJYP1iIsFx2UJvezMAS8t1dD9QdtAeCFWgkIiUDSluYn47/8RP/IOutez7yluG5Eq+FVClZOXCmU2I=
      file_glob: true
      file: out/**/zip/*
      skip_cleanup: true
      on:
        tags: true
```
		
### Trigger deployment
Trigger build with tagging
```sh
git tag --list
git tag 0.15.1.2
git push origin --tags
 * [new tag]         0.15.1.2 -> 0.15.1.2
```
