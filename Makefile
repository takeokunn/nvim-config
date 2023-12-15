EMACS ?= emacs

TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: clean
clean:
	rm -f ~/.config/nvim

.PHONY: link
link:
	ln -nfs $(TOP_DIR) ~/.config/nvim

.PHONY: compile
compile:
	$(EMACS) -Q --batch --eval "(progn (require 'ob-tangle) (org-babel-tangle-file \"./index.org\" \"./init.vim\" \"vim\"))"
