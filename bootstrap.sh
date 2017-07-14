#!/bin/bash

cd "$(dirname "$0")"
#git pull
function doIt() {
  rsync --exclude "config-files" --exclude ".osx" --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" --exclude "INSTALL.md" -av --no-perms . ~
  rsync -av --no-perms config-folder/ ~/.config/
  echo "!!! Start a new terminal session !!!"
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
