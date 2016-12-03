# Exports.
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export EDITOR="vim"

export PATH="$PATH:~/.scripts"

# Append to history - don't overwrite.
shopt -s histappend

# Includes.
if [[ -f ~/.bash_functions ]]; then
  . ~/.bash_functions
fi
if [[ -f ~/.aliases ]]; then
  . ~/.aliases
fi

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi

# Rbenv.
if command_exists rbenv ; then
  eval "$(rbenv init -)"
fi
