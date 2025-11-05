all: git-install.pdf git-tutorial.pdf

%.pdf: %.md
	pandoc $< -o $@
