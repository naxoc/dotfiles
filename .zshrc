autoload -Uz compinit && compinit

source "$HOME/Documents/Computer/export-vars"
source "$HOME/.aliases"  

# PHPStorm workaround. See https://stackoverflow.com/questions/61469797/intellij-not-picking-up-environment-variables-when-using-zsh
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then

  # Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

  # Set name of the theme to load --- if set to "random", it will
  # load a random theme each time oh-my-zsh is loaded, in which case,
  # to know which specific one was loaded, run: echo $RANDOM_THEME
  # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
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

  # User configuration

  # export MANPATH="/usr/local/man:$MANPATH"

  # You may need to manually set your language environment
  # export LANG=en_US.UTF-8

  # Preferred editor for local and remote sessions
  export EDITOR='vim'
  
  # Compilation flags
  # export ARCHFLAGS="-arch x86_64"

  # Set personal aliases, overriding those provided by oh-my-zsh libs,
  # plugins, and themes. Aliases can be placed here, though oh-my-zsh
  # users are encouraged to define aliases within the ZSH_CUSTOM folder.
  # For a full list of active aliases, run `alias`.

  # Example aliases
  # alias zshconfig="mate ~/.zshrc"
	
	#export GPG_TTY=$(tty)
	#gpgconf --launch gpg-agent

	export PATH=$PATH:~/.composer/vendor/bin
  export PATH="$HOME/Documents/Computer/.scripts:$PATH"
  
	ldjson() {
		http "$1" | ag "ld\+json" | sed -e 's/<[^>]*>//g' | jq
	}

	npsites() {
		 sed '1d' "$HOME/all_newspack_sites.csv" |  ag $1 --no-numbers | awk -F',' '{print $3}' | tr -d '"'
	}
	chillogs() {
		logfiles=$1
		if [ -z "$logfiles" ]; then
            logfiles="*.log"
        fi
		find . -type f -name "$logfiles" -print0 | xargs -0 sed 's/^\[[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}\] //' | lnav
	}


fi # Conditional for PHPstorm end

export MA_COMPUTER='bigelow'

# Hack. See https://community.localwp.com/t/lightning-open-site-shell-not-working/14150/4
if [[ $PATH =~ :/Applications/Local\.app ]]; then
	# We are on Local 
	MA_ICON='🦈'
else
	MA_ICON='🐴'
fi

export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

	
#export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
#export PUPPETEER_EXECUTABLE_PATH=`which chromium`

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/shims:$PATH"
#eval "$(pyenv init -)"


source <(fzf --zsh)
#export FZF_CTRL_R_OPTS="
  #--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  #--color header:italic
  #--header 'Press CTRL-Y to copy command into clipboard'"
#source ${HOME}/.ghcup/env
