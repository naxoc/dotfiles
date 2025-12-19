# Use a fallback ZSH path
: ${ZSH:="$HOME/.oh-my-zsh"}

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -Uz compinit && compinit

# If PhpStorm is throwing a fit, then see https://stackoverflow.com/questions/61469797/intellij-not-picking-up-environment-variables-when-using-zsh

source "$HOME/Documents/Computer/export-vars"
source "$COMPUTER_FILES/dotfiles/.aliases"  
source "$COMPUTER_FILES/dotfiles/.bash_functions"  

ZSH_THEME="intheloop"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# git-prompt
plugins=(
  gh
  httpie
  zsh-syntax-highlighting
  dotenv
  aliases
)

# history-substring-search
source $ZSH/oh-my-zsh.sh

#export GPG_TTY=$(tty)
#gpgconf --launch gpg-agent

export PATH=$PATH:~/.composer/vendor/bin
export PATH="$COMPUTER_FILES/.scripts:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Preferred editor for local and remote sessions
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source <(fzf --zsh)
#export FZF_CTRL_R_OPTS="
  #--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  #--color header:italic
  #--header 'Press CTRL-Y to copy command into clipboard'"
#source ${HOME}/.ghcup/env
