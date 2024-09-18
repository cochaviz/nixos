set shell := ["bash", "-c"]

git-add:
  git add .
  
update:
  nix flake update

rebuild-nix: git-add
  sudo nixos-rebuild switch --flake .

rebuild-home: git-add
  home-manager switch --flake .

rebuild: rebuild-home rebuild-nix

init:
  git clone ssh:github@github.com/cochaviz/nixos && just rebuild


