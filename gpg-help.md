# gpg-help

* Link: https://steemit.com/security/@the-tech-guy/signing-git-commits-with-gpg-on-windows

```sh
git config --global gpg.program "C:/Program Files/GnuPG/bin/gpg.exe"
git config --global user.email "37987466+dalijolijo@users.noreply.github.com"
git config --global user.name "David"
git config --global user.signingkey 4E1337DE6C2AC05F9CD3BBF2C692FAAFAD272693 
```

save passphrase:
```sh
git config --global commit.gpgsign true
```
