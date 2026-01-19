Git Tutorial
============

Git is a version control system for tracking changes in your code and for
collaborating with others. It is a distributed version control system, meaning
that you can just use it on your own computer without needing an external
server although usually people would use it with a server and GitHub is a
popular provider of git servers. First here we will learn how to use git just
on your own computer.

## Installing Git

There is an accompanying guide `git-install.pdf` that explains how to install
git on your own computer.

## Creating a local git repository.

For this tutorial we want to have a few things open at the same time:

1. Create a directory called e.g. `git-tutorial-1` somewhere on your computer.
2. Open a terminal (use git bash on Windows) and navigate to the directory you
   just created with `cd`.
3. Open the directory in a file browser (Windows: Windows Explorer, Mac: Finder)
   so that you can see the files in it.
4. Use a code editor to create a file called `hello.py` in the directory.

Now in your terminal you can run git commands. The first command we will use
here is `ls` to see what files are in the directory and `ls -A` to see hidden
files as well. Then we will use `git init` to create a local git repository
(repo) in the directory:

```console
$ cd path/to/git-tutorial-1
$ ls
$ ls -A
$ git init
Initialised empty Git repository in ./sdpa/git-tutorial-1/.git/
$ ls -A
.git
```

Note that lines starting with `$` are commands you should run in your terminal
and other lines are the output of the commands. The output of `ls` initially
shows that there are no files in the directory. After running `git init` the
output of `ls -A` now shows that there is a `.git` directory. This is what was
created by `git init`.

Note that if you are on Windows then in git bash the `C:\` drive is called
`/c` so you may need to use something like `cd /c/Users/username/git-tutorial-1`
at the start here.

If we look in the `.git` directory we will see that it contains a bunch of stuff
that git uses:

```console
$ ls .git
branches  config  description  HEAD  hooks  info  objects  refs
```

We don't need to worry about what is in there but just understand that `git
init` created that directory and stores lots of information in there. When we
run git commands git will look for the `.git` directory and uses the contents
of that directory to do its work. Usually we ignore this directory and don't
go in there or change the files or anything but it is important to know that
it is there to understand how git works.

## Adding a file to the git repository

Now we want to add a file to the git repository. The reason to use git is that
is keeps track of our code files. Use an editor to create a file called
`hello.py` in the directory and add the following code to it:
```python
# This is a comment

print("Hello World")
```
Make sure to save the file.

In the command demonstrations below we will refer to the `gedit` command to mean
"edit the file using your editor" (`gedit` is the default editor on the Linux
lab machines). You don't have to use `gedit` but just whatever editor you want
and you don't have to open the editor from the terminal but you should use it
to create the file in the same directory that you are in in the terminal where
you run the `git init` command.

A typical sequence here is to edit the file, save it, and then inspect the
changes using commands like `ls` and our next git command `git status`. For
example:
```console
$ gedit hello.py # edit the file with your editor
$ ls             # check that the file is there
hello.py
$ ls -A          # show also hidden files (like the .git directory)
.git  hello.py
```
Now that we have created the file and saved it we can see what git thinks about
the situation with the `git status` command:
```console
$ git status
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	hello.py

nothing added to commit but untracked files present (use "git add" to track)
```
There is a lot to unpack here but for now let's just focus on the main thing
which is that `git` says that there is an untracked file called `hello.py`.
We want git to track the file but currently it is untracked. We can tell git
to track the file with the `git add` command:
```console
$ git add hello.py 
$ git status
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   hello.py
```
Now git says that there is a "new file" which is `hello.py` but it says that
there are changes to be committed. This means that git is aware that it is
tracking the `hello.py` file but we need to "commit" the changes so that they
can be saved for long term storage. We do this with the `git commit` command
and we should pass the `-m` option to `git commit` to pass a message to the
commit so that we can remember what we did later:
```console
$ git commit -m 'Add the hello.py file'
[main (root-commit) 73647e6] Add the hello.py file
 1 file changed, 3 insertions(+)
 create mode 100644 hello.py
```
This has created a "commit" which is a snapshot of the files in the git repo.
The commit has a unique ID (73647e6) and the commit message is "Add the
hello.py file". Now `git status` should show that there are no changes to be
committed:
```console
$ git status
On branch main
nothing to commit, working tree clean
```
We are not going to cover branches so we can ignore the "On branch main" line
but the important thing is that there are no changes to be committed. We
created the file, we told git to track it, and we committed it. The state of
the files in this directory have now been saved inside the `.git` directory.

# Changing a file in the git repository

Now that we have committed the file git will forever remember what the contents
of the file were at this point in time and we could refer back to this in say
10 years time if we wanted. If we change the file now then git will notice.
Use your editor to change the file to say "Hole mundo" in Spanish instead of
"Hello World" in English. Then we can run `git status` again
```console
$ gedit hello.py 
$ git status
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   hello.py

no changes added to commit (use "git add" and/or "git commit -a")
```
So `git` has noticed that the file has changed (it remembers the old contents
of the file because we committed it and it is stored in the `.git` directory).
We can ask `git` what has changed with the `git diff` command which shows us
the "diff" (difference) between the old and new contents of the file:
```console
$ git diff
diff --git a/hello.py b/hello.py
index d8562ce..8d102f4 100644
--- a/hello.py
+++ b/hello.py
@@ -1,3 +1,3 @@
 # This is a comment
 
-print("hello world")
+print("Hola mundo")
```
The output of `git diff` takes some getting use to. It shows us parts of the
file that have changed and where there is a change is shows lines beginning
with `+` for "additions" and lines beginning with `-` for "deletions". Here we
changed the word "hello" to "Hola" in the Spanish version but git sees this as
two changes: deleting the old line and then adding a new different line. It is
common for programmers to interpret the output of `git diff` in order to
understand how some code has been changed.

We can tell `git` to commit these new changes by running the two commands
`git add` and `git commit` again:
```console
$ git add hello.py 
$ git status
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   hello.py

$ git commit -m 'Rewrite in Spanish'
[main a8ec9e8] Rewrite in Spanish
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git status
On branch main
nothing to commit, working tree clean
```
Now we are back to the state we started with "nothing to commit, working tree
clean" meaning that git has seen and committed all of the changes we made but
now the message printed by the program is in Spanish:
```console
$ python hello.py 
Hola mundo
```

# Seeing the history of the code

Now that we have committed some changes we can see what the history of the
code is. We can use the `git log` command to see the commits that have been made
to the code:
```console
$ git log
commit a8ec9e80a31678a72b844e09f576641cb7c69dca (HEAD -> main)
Author: Oscar Benjamin <oscar.benjamin@bristol.ac.uk>
Date:   Wed Nov 4 14:15:17 2025 +0000

    Rewrite in Spanish

commit 73647e67026b3a2a83abde8394518ce6b091565a
Author: Oscar Benjamin <oscar.benjamin@bristol.ac.uk>
Date:   Wed Nov 4 15:02:01 2025 +0000

    Add the hello.py file
```
This shows that there have been two commits which are two separate changes or
snapshots of the code. It also shows the author of each commit and the date
and time that the commit was made and the commit message. Each commit has a
long unique identifier (a8ec9e8...) which is called the "hash" of the commit.

We can use the `git blame` command to see the origin of each line of code in
the file:
```console
$ git blame hello.py
^73647e6 (Oscar Benjamin 2025-11-04 14:02:01 +0000 1) # This is a comment
^73647e6 (Oscar Benjamin 2025-11-04 14:02:01 +0000 2) 
a8ec9e80 (Oscar Benjamin 2025-11-04 14:15:17 +0000 3) print("Hola mundo")
```
We can do other things like changing all the files back to an older version or
seeing what the changes were in a particular commit e.g.:
```console
$ git show a8ec9e80
commit a8ec9e80a31678a72b844e09f576641cb7c69dca (HEAD -> main)
Author: Oscar Benjamin <oscar.j.benjamin@gmail.com>
Date:   Wed Nov 4 14:15:17 2025 +0000

    Rewrite in Spanish

diff --git a/hello.py b/hello.py
index d8562ce..8d102f4 100644
--- a/hello.py
+++ b/hello.py
@@ -1,3 +1,3 @@
 # This is a comment
 
-print("hello world")
+print("Hola mundo")
```
This shows us many things about the particular line of code (line 3 in
hello.py) such as:

1. Who added the line of code (Oscar Benjamin)?
2. When was that line added (Wed Nov 4 14:15:17 2025 +0000)?
3. Why did they change the code (Rewrite in Spanish)?
4. What was the old version of the code (`print("hello world")`)?
5. What was the new version of the code (`print("Hola mundo")`)?
6. What other things did they change at the same time (nothing in this case)?

This information is very useful in future it we want to understand how the code
has changed and why. Any nontrivial codebase will have many commits and people
will use them to understand the history of the code.

# Exercise: The edit-add-commit cycle

Now that we have seen how to use git to track changes to files you should
familiarise yourself with the edit-commit cycle. Basically do the following
commands in different orders in a loop until you understand what is going on:
```console
$ git status     # always start with this
$ gedit hello.py # edit the file with your editor
$ git status     # run it again
$ git diff       # see what has changed
$ git add hello.py # prepare for commit
$ git status     # run git status all the time
$ git commit -m 'My new message' # commit the changes
$ git status     # yes, run it again!
$ git log        # see the commits
(and back to start ...)
```
When doing this keep making changes to `hello.py` and try to understand the
diffs (`git diff`) and the commits (`git log`). Also add new files e.g. add a
file called README.txt and commit that and so on. Play around with the commands
until you understand what the different commands do and what the output
messages from git mean.

# Remote git repositories (GitHub)

Usually a local git repository is coupled with a remote git repository on a
server. A very common choice for this is GitHub which provides remote git
servers for free. The accompanying git-install.pdf guide explains how to create
a GitHub account and get a personal access token from GitHub. To follow the
next steps here you will need both of these. We will suppose that your username
is "myusername".

If you go to github.com then on the left hand side it says "Top repositories"
and next to that there is a "new" button. Click that to create a new remote
repository:

- Give the repository a name like `git-tutorial-2`.
- Write a description that says "My first practice repo".
- Set the "visibility" to "private".
- Turn off all the other things e.g. no README, no .gitignore etc.
- Click "Create repository".

This will create a new remote repository on GitHub. In future you can access
this repository in a web browser at the URL
[https://github.com/myusername/git-tutorial-2](https://github.com/myusername/git-tutorial-2)

After you have created the repository github will show you some instructions
for how to connect to it from your machine. There are multiple ways to do this
but we will use the normal clone method.

On your computer in a terminal go to a directory where you want to put the new
local copy of the remote repository. Then run the `git clone` command:
```console
git clone https://github.com/myusername/git-tutorial-2.git
```
This URL can be copied from the GitHub page but make sure to use the HTTPS
version of the URL rather than the SSH version. In the terminal git will now
ask for your github username and password. Enter your username. For the
password copy in the personal access token (PAT) that you should have created
earlier. Depending on how you installed git it is possible that it will open
something like the git credential manager to store these details or otherwise
you might just need to copy them in every time you connect to github from the
terminal. When `git clone` finished it will print a warning:
```
warning: You appear to have cloned an empty repository.
```
Don't worry about that. We know that this repository is empty right now.

Once the `git clone` command has completed it will have created a directory
called `git-tutorial-2` in the current directory. You can `cd` into that
directory and run git commands there:
```console
$ ls
git-tutorial-2
$ cd git-tutorial-2
$ ls -A
.git
$ git status
On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```
It says there are no commits because we have not yet made any commits. It also
says that there is nothing to commit because there are no files in the directory
yet. Now use your editor to create a file and then add and commit that file:
```console
$ gedit hello.py
$ git status
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	hello.py
git add hello.py
$ git status
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   hello.py

$ git commit -m 'Add hello program'
[main (root-commit) 507b198] Add hello program
 1 file changed, 3 insertions(+)
 create mode 100644 hello.py
```
Now you have made the first commit with the added file but the commit is only
in your local repository on your computer. We want to get the commit to the
remote repsitory on GitHub and for that we use the `git push` command:
```console
$ git push
```
This may ask for your username and password again. Once `git push` completes
you should be able to got the github page for the repository in a web browser
and you should be able to see the file and the commits there. Make sure that
you can see the file.

Now try making some changes to the file, committing them, and pushing them
to GitHub again. Each time you push the changes they should appear on the
GitHub page for the repository. This is how you can make changes to your code
and then store them in the cloud. It might seem like this is quite complicated
compared to using something like dropbox or onedrive but there are important
reasons for using this more complicated workflow when collaborating with others.
Multiple people can have separate lo0cal repositories that connect to the same
remote repository and git can "merge" changes made by different people together.

To practice what it is like to have multiple local repos leave the current
directory and create a new remote repository. You can give it a different name
to tell them apart e.g.:
```console
$ cd ..  # go up one directory
$ git clone https://github.com/myusername/git-tutorial-2.git git-tutorial-2-v2
$ ls
git-tutorial-2  git-tutorial-2-v2
$ cd git-tutorial-2-v2
$ ls -A
.git  hello.py
```
Now if you use the `git-tutorial-2-v2` local repo you can make changes and
commit and push them to github. Then if you go back to the other local repo
`git-tutorial-2` you can use the `git pull` command to get the changes made
from elsewhere. There are two commands then that you use to synchronise changes
between your local repo and the remote repo:

- `git push` sends commits from your local repo to the remote repo.
- `git pull` gets commits from the remote repo to your local repo.

If multiple people are pushing to the same remore repo then often before you
can push you will need to pull first to get the latest changes from others.
If you make some commits and someone else makes some commits and pushes them
then git will not allow you to push until you have pulled and merged their
changes with `git pull`.

Practice pushing and pulling commits to send changes from one local repo to
github and then pull them back into another local repo.

The standard workflow when using git with a remote repository for a project
(such as the coursework assignment) is:

Go to github.com, create the repo and copy the URL and then use these commands:
```console
# This is only needed the first time when you create the repo:
git clone <url>

# This is what you do every time you are working on the code:
cd <repo-directory>
gedit <files>            # edit the files
git add <files>          # stage the changes
git commit -m 'message'  # make the commit
git push                 # send the changes to github
```
Good practice is to commit regularly and ideally make each commit a logical
change such as "Fix bug in function X" or "Add feature Y" rather than
"make lots of random changes". Use `git diff` to check what is changed before
committing. Run `git status` all the time to check what git thinks is going on.
