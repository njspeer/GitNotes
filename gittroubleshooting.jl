# fatal: The current branch <branchname> has no upstream branch.
"""
git push --set-upstream origin <branchname>
git push -u origin <branchname>               # same as above
git config --global push.default current      # always push new branches
"""