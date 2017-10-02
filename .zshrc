# Path to your oh-my-zsh installation.
export ZSH=/Users/ckj/.oh-my-zsh
ZSH_THEME=""
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-hubflow history-substring-search zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
autoload -U promptinit; promptinit
prompt pure

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# User configuration

export PATH="/Users/ckj/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ckj/.composer/vendor/bin:/Users/ckj.devops:/Users/ckj/.scripts:/Users/ckj/.scripts/inf-tools:/Users/ckj/.gem/ruby/2.0.0/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pstorm="open -a PHPStorm"
alias stree='open -a SourceTree .'
alias github='open -a GitHub\ Desktop .'
alias first='cd ~/Sites/avis/first/drupal'
alias second='cd ~/Sites/avis/second/drupal'

autoload bashcompinit
bashcompinit
#Include Drush completion.
if [ -f "/Users/ckj/.drush/drush.complete.sh" ] ; then
  source /Users/ckj/.drush/drush.complete.sh
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# Drupal console
source "$HOME/.console/console.rc" 2>/dev/null
# OSX Sierra does not add this for me, so I'll just do it here
# ssh-add ~/.ssh/id_rsa


