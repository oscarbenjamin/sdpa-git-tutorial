# GitHub_setup

## Setup local git

On Windows open `git-bash.exe` or otherwise on Mac/Linux open your terminal.

Once the prompt is visible, configure your local git settings:

> `$ git-config --global user.name "Your User Name"`

> `$ git-config --global user.email email@example.com`

## Authenticating with GitHub

If you are on Windows and using git bash then when you first try to push to
GitHub git bash will pop up a Window asking if you want to sign in in the
browser. Use that as it is the easiest wat to authenticate.

If you are on Mac or Linux then you cannot use this browser sign in method and
should instead create an ssh key and upload the public key to GitHub following
the instructions below.

Your GitHub repos always have a URL that is like
```
https://github.com/user-name/repo-name.git
```
that you can go to in a web browser. To run git commands in the terminal that
connect your local repo (on your computer) to the remote repo (on GitHub) you
will need to use the URL to the remote repo. However there are two versions of
the URL. The one above is the https version. The other version is the ssh
version. If you are authenticating with ssh then you must use the ssh version
of the URL that looks like
```
git@github.com:user-name/repo-name.git
```
In the GitHub website there are switcher buttons to choose between displaying
these two version of the repo URL.

## Generate ssh key

To generate an ssh key, type this terminal command:

> `ssh-keygen -t ed25519 -C youremail@example.com`

The command will ask where you want to save the key. Just press enter to accept
the default location (the `.ssh` folder in your home directory). Then the
command will ask for a pass phrase. Just press enter for no pass phrase. It
will ask you for the pass phrase again to confirm. Just press enter again.

This command will have created two files in the `.ssh` folder in your home
directory called `is_ed25519` (the private key) and `id_ed25519.pub` (the
public key). Don't ever give your private key to anyone else. It should just
stay safe on this one computer. The public key ios the one that you will upload
to GitHub.

To upload the public key to GitHub follow these steps:

- Go to the GitHub website and log in.
- Click your profile picture in the top right corner and select "Settings".
- On the left hand side there is a menu and you should click on "SSH and GPG keys".
- Then at the top right of the page there is a button "New SSH key". Click it.
- Then enter a name for your ssh key (eg. work-laptop) and copy the contents of
the `id_ed25519.pub` file into the "Key" box.

You can get the contents of the `id_ed25519.pub` file by typing this command in
the terminal:
```
$ cat ~/.ssh/id_ed25519.pub
```
The output will be something like
```
ssh-ed25519 SDFDSRFGDFGSDFASDASFADFASDASD your@email.com
```
Then copy the output and paste it into the "Key" box on GitHub.

Finally click the green "Add SSH key" button.

Now you should be able to push to GitHub. However since you are using ssh, you
must be careful when copying the URL for your repo to use the ssh version of
the URL, not the https version. For example it would be
```
git remote add origin git@github.com:username/repo.git
```
The https version would be (don't use this if using ssh though):
```
git remote add origin https://github.com/username/repo.git
```
