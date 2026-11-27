function fish_prompt
    # Username dan hostname
    set_color a6e3a1
    printf '%s@%s' $USER (hostname)

    # Direktori
    set_color cdd6f4
    printf ':'

    set_color 89b4fa
    printf '%s' (prompt_pwd)

    # Status Git
    set -l branch (git branch --show-current 2>/dev/null)

    if test -n "$branch"
        set_color cba6f7
        printf ' (%s)' $branch
    end

    # Simbol prompt
    set_color f5c2e7
    if test (id -u) -eq 0
        printf '# '
    else
        printf '$ '
    end

    set_color normal
end
