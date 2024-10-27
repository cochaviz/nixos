function fish_command_not_found
  set -l cmd $argv[1]
  set_color red --bold
  echo "Command Not Found: '$cmd'"
  set_color normal
  
  set_color yellow
  echo "To install, try:"
  set_color cyan
  echo "  nix-shell -p $cmd"
  echo "  nix shell nixpkgs#$cmd"
  set_color normal
  
  return 127
end
