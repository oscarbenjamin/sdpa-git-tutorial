Installing Git
==============

MacOS
-----

Open a terminal window and type `git`. If it is installed, you'll see something
like:
```
$ git
usage: git [--version] [--help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           [--super-prefix=<path>] [--config-env=<name>=<envvar>]
           <command> [<args>]

The most commonly used git commands are:
    add        Add file contents to the index
    ...
```
If is not installed, it should pop with a message asking if you want to install
the MacOS command line tools. Follow the prompts to install git. Then open a
terminal window and type `git`.

If it still isn't working try running `xcode-select --install` in a terminal.

Windows
-------

Download and install the [Git for Windows](https://git-scm.com/download/win).
You probably want the "Windows/x64" version.

I made a video showing which buttons to click in the installer:

[CLICK HERE FOR VIDEO](https://uob-my.sharepoint.com/personal/enojb_bristol_ac_uk/_layouts/15/stream.aspx?id=%2Fpersonal%2Fenojb%5Fbristol%5Fac%5Fuk%2FDocuments%2FStream%20Migrated%20Videos%2Finstall%2Dgit%2Dfor%2Dwindows%2D20210202%5F113419%2Emkv&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Eee0e3616%2Ddd42%2D44d2%2Db10c%2D8cb5d41143f8)

Mostly just click the "Next" button with all default settings but change the
"Use MinTTY option" and choose "Use Windows' default console window" instead.
I am not sure if that is still necessary but it used to be. (Note that I don't 
have any computers with Windows so I can't test this.)

Once you have installed Git for Windows you should have the "git bash" program.
If you run that it opens a special terminal where you can run git commands so
try typing `git` in the terminal and see if it works.

Sign up to GitHub
-----------------

To use GitHub you need to sign up for an account.

Go to [GitHub](https://github.com) and click the "Sign up" button. You will
have to give some details, confirm email and so on.

Make a GitHub personal access token (PAT)
-----------------------------------------

GitHub has a feature called "personal access tokens" that allows you to create
a token that you can use to authenticate with GitHub. This is needed since
around 2022 GitHub stopped allowing people to authenticate with a username and
password. Instead they require you to use a personal access token.

You can find GitHub's instructions for access tokens here:
[https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic)

Here are the steps:

1. Verify your email address
2. In the upper right corner of any page on GitHub, click your profile pictures,
    then click Settings.
3, In the left sidebar, click Developer settings (way down at the bottom).
4. In the left sidebar, click Personal access tokens and then "tokens (classic)".
5. Choose "generate new token" and then "generate new token (classic)".
6. At this point you may need to authenticate with GitHub (when I tried this it
   wants me to authenticate with my phone but you might not need to do that).
7. Set a "Note" for the token (e.g. "`SDPA_LEARNING_GIT_TOKEN`") so that you 
    can remember what it is for.
8. Set the expiration to something reasonable (I used "No expiration" which is
   probably fine for now but in future you might want to set it to something
   shorter for better security).
9. Under scopes tick the "repo" button (I think this is the only one you need).
10. Click "Generate token".
11. You are now shown the token which looks something like this:
    `ghp_a1asd12323534523423423423423`. Copy this to your clipboard and save it
    somewhere safe. You will need it later e.g. when cloning a private repo.
12. Later on if you run a git command and it asks for your username and password
    you can enter your GitHub username and the token you just created is the
    password that you can paste in.

In future if you find yourself using GitHub more than you may want to setup SSH
keys instead of using a PAT but we are not covering how to do that here.
