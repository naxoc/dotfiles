autoload -Uz compinit && compinit
# PHPStorm workaround. See https://stackoverflow.com/questions/61469797/intellij-not-picking-up-environment-variables-when-using-zsh
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then

  # Path to your oh-my-zsh installation.
  export ZSH="/Users/ckj/.oh-my-zsh"

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
  git
  tig
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

  # Remember The Milk
  alias rcal="rtm planner --start today and not list:Someday"
  alias today="rtm ls 'dueBefore:now AND status:incomplete'"
  alias arbejde="rtm ls dueBefore:now AND status:incomplete AND listContains:[work]"

  alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
  alias b='git branch --sort=committerdate'
	alias typora="open -a typora"

	alias pproj='cd ~/Documents/PARA/Projects/Newspack'
	alias pref='cd ~/Documents/PARA/Reference'

	# Newspack
	alias mcom="code /Users/ckj/Documents/PARA/Projects/Newspack/commands"
	#alias at-connect="./Users/ckj/Code/newspack/tools/atomic-connect "
	#alias go-knife="cd ~/Code/newspack/tools/newspack-launch-army-knife"

  #export PATH="/usr/local/sbin:$PATH"
  # export PATH="~/.gem/ruby/2.6.0/bin:$PATH"
  # export PATH="~/.rbenv/bin:$PATH"
	export PATH=$PATH:~/.composer/vendor/bin
  export PATH="/Users/ckj/Documents/Computer/.scripts:$PATH"

  # Work aliases
  alias synk="cd ~/Code/sandbox && unison -ui text -repeat watch automattic-sandbox"
  alias reset-synk="cd ~/Code/sandbox && unison -ui text  -force ssh://wpdev@naxoc.dev.dfw.wordpress.com//home/wpcom/public_html automattic-sandbox"

	# Older stuff like forums, Gravatar and P2
	#alias grav-synk="cd ~/Code/gravatar && unison -ui text -repeat watch gravatar"

  ## The Changer. Get it?
  #alias fitz='./dev/build changed -w -s -p '

  #alias monorepo='cd ~/Code/sandbox/wp-content/themes/pub/p2020'
  #alias pub='cd ~/Code/sandbox/wp-content/themes/pub'
	#alias themesupportforums='cd ~/Code/sandbox/wp-content/themes/a8c/supportforums'
  #alias supportforums='cd ~/Code/sandbox/wp-content/plugins/support-forums'
  #alias tailcom='ssh -t kassen "tail -f /tmp/php-errors"'
	#alias rep='cd /Users/ckj/Code/newspack/repos'

  #skub() {
    #cd ~/Code/sandbox/wp-content/themes/pub/p2020
    #./dev/sandbox -s wpcom-sandbox push -p "$1"
    #cd -
  #}

	ldjson() {
		http "$1" | ag "ld\+json" | sed -e 's/<[^>]*>//g' | jq
	}

	whodonnit() {
		cat ~/Library/Application\ Support/Local/ssh-entry/$1.sh |  perl -nle 'print $1 if /echo -n -e "\\033]0;(.*?)Shell\\007"/'
	}

	npsites() {
		 sed '1d' ~/Code/newspack/tools/newspack-launch-army-knife/all_newspack_sites.csv |  ag $1 --no-numbers | awk -F',' '{print $3}' | tr -d '"'
	}
	chillogs() {
		logfiles=$1
		if [ -z "$logfiles" ]; then
            logfiles="*.log"
        fi
		find . -type f -name "$logfiles" -print0 | xargs -0 sed 's/^\[[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}\] //' | lnav
	}

	alias dbsizes="du -sh ~/Library/Application\ Support/Local/run/* | sort -h --reverse"

fi # Conditional for PHPstorm end

export MA_COMPUTER='bigelow'

# Hack. See https://community.localwp.com/t/lightning-open-site-shell-not-working/14150/4
if [[ $PATH =~ :/Applications/Local\.app ]]; then
	# We are on Local 
	MA_ICON='🦈'
else

	#export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
	#export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"
	#export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
	#export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"
	MA_ICON='🐴'
fi

export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias t='todo.sh -d ~/.todo.cfg'
alias marked="open -a Marked"

	
# My sandbox
export WPCOM_SANDBOX=kassen

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

alias n="/Users/ckj/Code/newspack-docker/n"
NEWSPACK_DOCKER_ROOT=/Users/ckj/Code/newspack-docker
source /Users/ckj/Code/newspack-docker/bin/ncd.sh

