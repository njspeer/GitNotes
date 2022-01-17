# GitNotes

## How to take a working directory to Github

#### from a working directory:

0. got to github.com and create a new repository (e.g. Logger.jl.git)
1. -> git init
2. -> git add .
3. -> git commit -m 'first commit'
4. -> git remote add origin git@github.com:njspeer/Logger.jl.git
5. -> git push -u -f origin master

## How to set the SSH keys

#### From a command-line terminal

<!--to generate an rsa-key pair /home/nathan/.ssh/id_rsa is the default location -->
0.  ssh-keygen

