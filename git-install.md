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
