if status is-interactive
    # Commands to run in interactive sessions can go here
set fish_greeting
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

alias ls='ls --color=auto always'
alias grep='grep --color=auto always'
alias ls='eza --icons always'
alias ll='eza -lh --icons --git always'
alias la='eza -la --icons always'
alias lt='eza --tree --level=2 --icons always'

# Created by `pipx` on 2026-10-17 08:06:03
set PATH $PATH /home/arch/.local/bin
