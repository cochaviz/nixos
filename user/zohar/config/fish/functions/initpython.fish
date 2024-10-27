function initpython --description "Initialize Python virtual environment with optional version specification"
    argparse 'v/version=' -- $argv
    or return

    set pyversion "python"
    if set -q _flag_version
        # Remove dots from version number
        set cleaned_version (string replace -a '.' '' $_flag_version)
        set pyversion "python$cleaned_version"
    end

    nix-shell -p $pyversion --command "python -m venv .venv"
    cd .
end
