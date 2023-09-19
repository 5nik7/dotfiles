function cd() {
	builtin cd "$@" && eza -la --icons --hyperlink --git-repos --git --group-directories-first --no-filesize --no-user --no-time --no-permissions
}

function fixpath() {
	PATH=$(echo $(sed 's/:/\n/g' <<<$PATH | sort | uniq) | sed -e 's/\s/':'/g')
}

# vim:ft=zsh:nowrap
