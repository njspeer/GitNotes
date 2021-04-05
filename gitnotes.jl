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


