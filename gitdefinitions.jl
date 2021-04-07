
# HEAD
"""
The branch that is currently checked out

→ cat .git/HEAD
ref: refs/heads/main
ref: refs/heads/Make_Recipes_Table_20210327
"""

# Detached HEAD
"""
In rare cases, the HEAD file does NOT contain a branch reference, but a SHA-1 value of a specific revision. 
This happens when you checkout a specific commit, tag, or remote branch. Your repository is then in a state called Detached HEAD.
"""

# origin
"""
An alias for the remote repository from which the repository was cloned.

to view the URL type:
→ git remote -v
  > origin	git@github.com:njspeer/GitNotes.git (fetch)
  > origin	git@github.com:njspeer/GitNotes.git (push)

  # the following are equivalent:
  git push origin <branchname>
  gir push git@github.com:njspeer/GitNotes.git <branchname>
""" 

