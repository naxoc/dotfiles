# Open PhpStorm
function pstorm() {
  open -na "PhpStorm.app" --args "$@"
}

# Get LD+JSON from a URL
ldjson() {
	http "$1" | ag "ld\+json" | sed -e 's/<[^>]*>//g' | jq
}

# Search Newspack sites CSV
npsites() {
	 sed '1d' "$KNIFE_DIR/all_newspack_sites.csv" |  ag $1 --no-numbers | awk -F',' '{print $3}' | tr -d '"'
}

chillogs() {
	logfiles=$1
	if [ -z "$logfiles" ]; then
           logfiles="*.log"
       fi
	find . -type f -name "$logfiles" -print0 | xargs -0 sed 's/^\[[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}\] //' | lnav
}
