# git-help

## Define `gitlog` alias
```
alias gitlog='git log --graph --oneline --decorate --all'
```

## Clone GitHub repository
```
git clone https://github.com/dalijolijo/bisq-assets.git
cd bisq-assets
```

## Change to branch `list-diamond-asset`
```
git checkout list-diamond-asset
```

## Add remote master of my remote fork (needed?)
```
git remote add upstream https://github.com/bisq-network/bisq-assets.git
```

## Make sure everything looks right
```
gitlog

| | | * 3513b32 (HEAD, origin/list-diamond-asset, list-diamond-asset) Apply Bisq code style
| | | * d2eb7f9 List Diamond (DMD)
```

## Squash two commits
```
git rebase -i HEAD^^ 
```

In the editor you change `pick` to `fixup` on the commits you want to merge with upper commit.
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

## Rename last commit text
```
git commit --amend
```

## Remove commits (Cherry pick)
Example git log
```
Number	Hash	Commit Message	Author
1	2c6a45b	(HEAD) Adding public method to access protected method	Tom
2	ae45fab	Updates to database interface	Contractor 1
3	77b9b82	Improving database interface	Contractor 2
4	3c9093c	Merged develop branch into master	Tom
5	b3d92c5	Adding new Event CMS Module	Paul
6	7feddbb	Adding CMS class and files	Tom
7	a809379	Adding project to Git	Tom
```
Say we want to remove commits 2 & 4 from the repo.

* `git checkout b3d92c5` Checkout the last usable commit.
* `git checkout -b repair` Create a new branch to work on.
* `git cherry-pick 77b9b82` Run through commit 3.
* `git cherry-pick 2c6a45b` Run through commit 1.
* `git checkout master` Checkout master.
* `git reset --hard b3d92c5` Reset master to last usable commit.
* `git merge repair` Merge our new branch onto master.
* `git push --hard origin master` Push master to the remote repo.

## Push to remote branch
```
git push --force

Counting objects: 1, done.
Writing objects: 100% (1/1), 203 bytes | 0 bytes/s, done.
Total 1 (delta 0), reused 0 (delta 0)
To https://github.com/dalijolijo/bisq-assets.git
 + 3513b32...bcc60b5 list-diamond-asset -> list-diamond-asset (forced update)
```

# How do I update a GitHub forked repository
Add the remote, call it "upstream":
```
git remote add upstream https://github.com/whoever/whatever.git
```

Fetch all the branches of that remote into remote-tracking branches, such as upstream/master:
```
git fetch upstream
```

Make sure that you're on your master branch:
```
git checkout master
```

Rewrite your master branch so that any commits of yours that aren't already in upstream/master are replayed on top of that other branch:
```
git rebase upstream/master
```

If you've rebased your branch onto upstream/master you may need to force the push in order to push it to your own forked repository on GitHub. You'd do that with:
```
git push -f origin master
```
