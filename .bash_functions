# This function is used from my git aliases.
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# Show a hitlist of commands most used from history.
function hitlist() {
  history | awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -r
}

# Create a new directory and enter it.
function mkd() {
  mkdir -p "$@" && cd "$_";
  }

# Change working directory to the top-most Finder window location
function cdf() {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
  local port="${1:-4000}";
  local ip=$(ipconfig getifaddr en1);
  sleep 1 && open "http://${ip}:${port}/"port &
  php -S "${ip}:${port}";
}

# Simple google search from CLI.
function goo() {
  q="$@"
  open "http://google.com/search?q=$q"
}

# Check if command is available.
command_exists () {
    type "$1" &> /dev/null ;
}
