# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/mysql/bin:/usr/local/bin:/Users/ckj/.scripts/inf-tools:/Users/ckj/.scripts/mytools:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

# User configuration
export LANG=en_US.UTF-8

export EDITOR='vim'

alias pstorm="open -a PHPStorm"
alias stree='open -a SourceTree .'

alias release-code='/Users/ckj/Documents/inf-devops/bin/release';
alias first='cd ~/Sites/avis/first/drupal'
alias second='cd ~/Sites/avis/second/drupal'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
eval $(cachalot env)
