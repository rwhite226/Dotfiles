#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# Variables
dir=~/.dotfiles                    # dotfiles directory
files="xinitrc vimrc vim zshrc Xresources emacs emacs.d"    # list of files/folders to symlink in homedir
gitacc=git@github.com:rwhite226/Dotfiles.git


# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
		echo "Creating symlink to $file in home directory."
		        ln -s $dir/$file ~/.$file
		done
# Git add any changed files
git add -A

#Ask for and add a commit for git
echo "Add commit"
read commit
git commit -m "$commit"

# Push changes to gitacc
git push $gitacc

