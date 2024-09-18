function fish_prompt
    set -l __last_command_exit_status $status

    set -l nix_shell_info ""

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l arrow_color "$green"
    if test $__last_command_exit_status != 0
        set arrow_color "$red"
    end

    if test -n "$IN_NIX_SHELL"
        if test -n "$CUSTOM_NIX_ENV"
            set nix_shell_info  $yellow"[$CUSTOM_NIX_ENV]" 
        else
            set nix_shell_info  $yellow"[nix-shell]" 
        end
    end
    
    set -l lambda "$arrow_color λ"
    set -l cwd $cyan(basename (prompt_pwd))

    echo -n -s $nix_shell_info' '$cwd' '$lambda$normal'  '
end
