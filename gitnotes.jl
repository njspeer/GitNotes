# Just some random notes for me regarding Git and GitHub

# The best book I've found:  https://git-scm.com/book/en/v2

# How to set up your git evironment (assuming you've already installed git)

# set up global username, email and editor
"""
1) git config --global user.name "yourname"
2) git config --global user.email "youremail"
3) git config --global core.editor "nano"
"""

# set up ssh-key (for more details, see https://docs.github.com/en/enterprise-server@2.22/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
"""
4) → ssh-keygen -t ed25519 -C "youremail@example.com"
   This creates a new ssh key, using the provided email as a label.
   > Generating public/private ed25519 key pair.

   4.1) When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.
        > Enter a file in which to save the key (/home/you/.ssh/id_ed25519): [Press enter]

   4.2) At the prompt, press enter for no a secure passphrase. 
        (or type a passphrase, if needed) for working with passphrases, see here: https://docs.github.com/en/enterprise-server@2.22/articles/working-with-ssh-key-passphrases
        > Enter passphrase (empty for no passphrase): [Type a passphrase]
        > Enter same passphrase again: [Type passphrase again]

   4.3) Start the ssh-agent in the background.
        →  eval "$(ssh-agent -s)"
        > Agent pid 59566

   4.4) Add your SSH private key to the ssh-agent. 
        If you created your key with a different name, or if you are adding an existing key that has a different name, 
        replace id_ed25519 in the command with the name of your private key file.
        → ssh-add ~/.ssh/id_ed25519

   4.5) Adding a new SSH key to your GitHub account (https://docs.github.com/en/enterprise-server@2.22/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
        Copy the SSH public key to your clipboard.
        If your SSH public key file has a different name than the example code, modify the filename to match your current setup. 
        When copying your key, don't add any newlines or whitespace.
        → sudo apt-get install xclip

   4.6) In the upper-right corner of any GitHub page, click your profile photo, then click Settings.
        In the user settings sidebar, click SSH and GPG keys.
        Click New SSH key or Add SSH key.
        In the "Title" field, add a descriptive label for the new key.
        Click Add SSH key.
"""

# initialize a new repository
"""
5) git init
   git add .
   git commit
   git push
"""

# Or clone an existing repository
"""
6) git clone https://github.com/libgit2/libgit2
   git clone https://github.com/libgit2/libgit2 mylibgit # clones same repository into a dir named 'mylibgit'
"""

# Checking the Status of Your Files
"""
The main tool you use to determine which files are in which state is the git status command. If you run this command directly after a clone, you should see something like this:
→ git status
"""

# Ignoring Files
"""
Often, you’ll have a class of files that you don’t want Git to automatically add or even show you as being untracked. 
These are generally automatically generated files such as log files or files produced by your build system. 
In such cases, you can create a file listing patterns to match them named .gitignore. Here is an example .gitignore file:

→ cat .gitignore
*.[oa]
*~

The first line tells Git to ignore any files ending in “.o” or “.a” — object and archive files that may be the product of building your code. 
The second line tells Git to ignore all files whose names end with a tilde (~), which is used by many text editors such as Emacs to mark temporary files.

The rules for the patterns you can put in the .gitignore file are as follows:

  • Blank lines or lines starting with # are ignored.
  • Standard glob patterns work, and will be applied recursively throughout the entire working tree.
  • You can start patterns with a forward slash (/) to avoid recursivity.
  • You can end patterns with a forward slash (/) to specify a directory.
  • You can negate a pattern by starting it with an exclamation point (!).

  Glob patterns are like simplified regular expressions that shells use. 
  An asterisk (*) matches zero or more characters; [abc] matches any character inside the brackets (in this case a, b, or c); 
  a question mark (?) matches a single character; 
  and brackets enclosing characters separated by a hyphen ([0-9]) matches any character between them (in this case 0 through 9). 
  You can also use two asterisks to match nested directories; a/**/z would match a/z, a/b/z, a/b/c/z, and so on.

  for a large list of examples, see here:  https://github.com/github/gitignore
"""

# To see what chages you've made in more detail
"""
→ git diff
→ git diff --staged
→ git diff --cached # same as --staged

Note:
We will continue to use the git diff command in various ways throughout the rest of the book. 
There is another way to look at these diffs if you prefer a graphical or external diff viewing program instead. 
If you run git difftool instead of git diff, you can view any of these diffs in software like emerge, vimdiff and many more (including commercial products). 
Run git difftool --tool-help to see what is available on your system.
"""

# Committing Your Changes
"""
→ git add .
→ git commit # then add comments in editor
→ git commit -m "add comments in one line"

Or, to skip the 'git add .' part
→ git commit -a             # (will stage everything that is already being tracked)
→ git commit -a -m 'update' # will also add the comments
"""

# Removing Files
"""
→ git rm filename
→ git add .
→ git commit -m 'comment'
→ git push
# the above removes filename from the local repository, staging and GitHub

# I believe the above is equivalent to the following:
→ rm file
→ git add .
→ git commit -m 'removed file'
→ git push

Note:
According to the internet, there are some safety checks that take place when you use git rm
Specifically, git will block removal if there are discrepancies between the HEAD version and the staged index
"""

# Moving/Renaming Files
"""
→ git mv README.md README

Is equivalent to:

→ mv README.md README
→ git rm README.md
→ git add README
"""

# Viewing the Commit History
"""
git log
git log -p (or git log --patch)   # shows the differences

git log --pretty=format           # make output pretty

%H      Commit hash
%h      Abbreviated commit hash
%T      Tree hash
%t      Abbreviated tree hash
%P      Parent hashes
%p      Abbreviated parent hashes
%an     Author name
%ae     Author email
%ad     Author date (format respects the --date=option)
%ar     Author date, relative
%cn     Committer name
%ce     Committer email
%cd     Committer date
%cr     Committer date, relative
%s      Subject

Examples
git log --pretty=format:"%h %s" --graph

Common optons:

Option	Description
-p                Show the patch introduced with each commit.
--stat            Show statistics for files modified in each commit.
--shortstat       Display only the changed/insertions/deletions line from the --stat command.
--name-only       Show the list of files modified after the commit information.
--name-status     Show the list of files affected with added/modified/deleted information as well.
--abbrev-commit   Show only the first few characters of the SHA-1 checksum instead of all 40.
--relative-date   Display the date in a relative format (for example, “2 weeks ago”) instead of using the full date format.
--graph           Display an ASCII graph of the branch and merge history beside the log output.
--pretty          Show commits in an alternate format. Option values include oneline, short, full, fuller, and format (where you specify your own format).
--oneline         Shorthand for --pretty=oneline --abbrev-commit used together.

Limiting options:
git log --since   # 
git log --until
git log --author
git log --grep
git log -S        # shows only commits that changed the number of occurrences of string S

Example
git log --since=2.weeks
git log -- path/to/file   # shows only changes to file
"""

# Update a commit message
"""
→ git commit -m 'Initial commit'
→ git add forgotten_file
→ git commit --amend
"""

# Unstaging a Staged File
"""
git reset HEAD File
"""

# Unmodifying a Modified File
"""
Make changes and then run git status to see how to restore each file that is different
git restore <file>
for example

**Note that this is a dangerous command and should only be used as a last resort**
"""

# Showing Your Remotes
"""
git remote
git remote -v
"""

# Adding Remote Repositories
"""
git remote add <shortname> <url>
If you clone a repository, the command automatically adds that remote repository under the name “origin”.
"""

# Fetching from Your Remotes
"""
→ git fetch <remote>

Pulls down all the data from that remote project that you don’t have yet. After you do this, 
you should have references to all the branches from that remote, which you can merge in or inspect at any time.

If you clone a repository, the command automatically adds that remote repository under the name “origin”. 
So, git fetch origin fetches any new work that has been pushed to that server since you cloned (or last fetched from) it. 
It’s important to note that the git fetch command only downloads the data to your local repository 
— it doesn’t automatically merge it with any of your work or modify what you’re currently working on. 
You have to merge it manually into your work when you’re ready.
"""

# Pulling from Your Remotes
"""
git pull [<options>] [<repository> [<refspec>...]]

Fetch from and integrate with another repository or a local branch.

Incorporates changes from a remote repository into the current branch. In its default mode, git pull is
shorthand for git fetch followed by git merge FETCH_HEAD.

<repository> should be the name of a remote repository as passed to git-fetch. 
<refspec> can name an arbitrary remote ref (for example, the name of a tag) or even a collection of refs with corresponding
remote-tracking branches (e.g., refs/heads/*:refs/remotes/origin/*), but usually it is the name of a branch
in the remote repository.

Default values for <repository> and <branch> are read from the "remote" and "merge" configuration for the
current branch as set by git-branch(1) --track.

see git pull --help for a nice explanation:
"""

# Pushing to Your Remotes
"""
git push <remote> <branch> (e.g., git push origin master)
"""

# inspect reomote
""" 
git remote show <remote> (e.g., git remote show origin)
"""

# Renaming and Removing Remotes
"""
git remote rename <oldremote> <newremote>
git remote remove <remote>
"""

# Listing Your Tags
"""
git tag                 # list all tags
git tag -l "v1.8.5*"    # list tags that match pattern
"""

# Creating Lightweight Tags
"""
# Lightweight tag: a pointer to a specific commit.
git tag v1.4-lw
"""

# Creating Annotated Tags
"""
# to create an annotated tag, just use the -a flag
git tag -a v1.4 -m "my version 1.4"
"""

# tagging older commits
"""
→ git log --pretty=oneline
15027957951b64cf874c3557a0f3547bd83b3ff6 Merge branch 'experiment'
a6b4c97498bd301d84096da251c98a07c7723e65 Create write support
0d52aaab4479697da7686c15f77a3d64d9165190 One more thing
6d52a271eda8725415634dd79daabbc4d9b6008e Merge branch 'experiment'
0b7434d86859cc7b8c3d5e1dddfed66ff742fcbc Add commit function
4682c3261057305bdd616e23b64b0857d832627b Add todo file
166ae0c4d3f420721acbb115cc33848dfcc2121a Create write support
9fceb02d0ae598e95dc970b74767f19372d61af8 Update rakefile
964f16d36dfccde844893cac5b347e7b3d44abbc Commit the todo
8a5cbc430f1a9c3d00faaeffd07798508422908a Update readme

git tag -a v1.2 9fceb02
Where, 9fceb02 is the first 7 characters of the commit hash (see example, above)
"""

# Sharing Tags
"""
By default, the git push command doesn’t transfer tags to remote servers. 
You will have to explicitly push tags to a shared server after you have created them. 
This process is just like sharing remote branches — you can run:
git push origin <tagname>
"""

# Deleting Tags
"""
# Delete local tags
git tag -d <tagname>

# Delete remote tags
git push origin --delete <tagname>
"""

# Checking out Tags
"""
If you want to view the versions of files a tag is pointing to, you can do a git checkout of that tag, 
although this puts your repository in “detached HEAD” state, which has some ill side effects:
→ git checkout <tag>

In “detached HEAD” state, if you make changes and then create a commit, the tag will stay the same, 
but your new commit won’t belong to any branch and will be unreachable, except by the exact commit hash. 
Thus, if you need to make changes — say you’re fixing a bug on an older version, 
for instance — you will generally want to create a branch:

→ git checkout -b version2 v2.0.0
Switched to a new branch 'version2'
"""

# Git Aliases
"""
→ git config --global alias.co checkout
→ git config --global alias.br branch
→ git config --global alias.ci commit
→ git config --global alias.st status
→ git config --global alias.unstage 'reset HEAD --'
→ git config --global alias.last 'log -1 HEAD'
→ git config --global alias.visual '!gitk'             # use ! to run external commands

# let's make an aliases to plot the git networks
[alias]
lg1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
lg = !"git lg1"

git log --all --decorate --oneline --graph

"""

# Creating a New Branch
"""
→ git branch <newbranch>      # Creates a new pointer to the same commit you’re currently on.

"""

# Switching Branches
"""
→ git checkout <branch>            # Moves HEAD to point to branch.
→ git switch <branch>              # equivalent to above

→ git checkout -b <newbranchn>     # create a new branch and switch to it.
→ git switch -c <newbranch>        # equivalent to above
"""

# Merge Branches
"""
git checkout master
git merge <branch>
"""


# Working with Branches
"""
→ git branch                           # list of branches
→ git branch -v                        # list of branches with last commit
→ git branch --merged                  # list merged branches only
→ git branch --no-merged               # list branches that have not been merged
→ git branch --move <old> <new>        # change local branch name
→ git push --set-upstream origin <new> # pushes new branch name to remote repository
"""

# Remote Branches
"""
→ git ls-remote origin                    # lists brances and references hashes
→ git remote show origin                  # Manage the set of repositories ("remotes") whose branches you track.
"""

# Fetch
"""
→ git fetch <remote> 
# fetches any data from it that you don’t yet have
"""

# Pushing
"""
git push <remote> <branch>
# Updates remote refs using local refs, while sending objects necessary to complete the given refs.
  When the command line does not specify where to push with the <repository> argument, branch.*.remote
  configuration for the current branch is consulted to determine where to push. If the configuration is
  missing, it defaults to origin.

→ git push 
  [--all | --mirror | --tags] 
  [--follow-tags] 
  [--atomic] 
  [-n | --dry-run] 
  [--receive-pack=<git-receive-pack>]
  [--repo=<repository>] 
  [-f | --force] [-d | --delete] 
  [--prune] [-v | --verbose]
  [-u | --set-upstream] 
  [-o <string> | --push-option=<string>]
  [--[no-]signed|--signed=(true|false|if-asked)]
  [--force-with-lease[=<refname>[:<expect>]] 
  [--force-if-includes]]
  [--no-verify] [<repository> [<refspec>...]]
"""