# git-help

Define `gitlog` alias
```
alias gitlog='git log --graph --oneline --decorate --all'
```

Clone GitHub repository
```
git clone https://github.com/dalijolijo/bisq-assets.git
cd bisq-assets
```

Change to branch `list-diamond-asset`
```
git checkout list-diamond-asset
```

Add remote master of my remote fork (needed?)
```
git remote add upstream https://github.com/bisq-network/bisq-assets.git
```

Make sure everything looks right
```
gitlog

| | | * 3513b32 (HEAD, origin/list-diamond-asset, list-diamond-asset) Apply Bisq code style
| | | * d2eb7f9 List Diamond (DMD)
```

Squash two commits
```
git rebase -i HEAD^^ 
```

In the editor you change pick to fixup on the commits you want to merge with upper commit.
```
FROM:
pick d2eb7f9 List Diamond (DMD)
pick 3513b32 Apply Bisq code style
...

TO:
pick d2eb7f9 List Diamond (DMD)
fixup 3513b32 Apply Bisq code style
...
```

Push to remote branch
```
git push --force

Counting objects: 1, done.
Writing objects: 100% (1/1), 203 bytes | 0 bytes/s, done.
Total 1 (delta 0), reused 0 (delta 0)
To https://github.com/dalijolijo/bisq-assets.git
 + 3513b32...bcc60b5 list-diamond-asset -> list-diamond-asset (forced update)
```
