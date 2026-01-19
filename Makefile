all: git-install.pdf git-tutorial.pdf git-ssh.pdf

%.pdf: %.md
	pandoc $< -o $@
