if status is-interactive
    # Commands to run in interactive sessions can go here
end


alias ls='eza --icons always'
alias ll='eza -lh --icons --git always'
alias la='eza -la --icons always'
alias lt='eza --tree --level=2 --icons always'

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

alias update="sudo apt update"
alias upgrade="sudo apt update && sudo apt upgrade"
