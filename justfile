set shell := ["bash", "-c"]
testing-branch := "testing"

git-add:
  git add .

is-main-or-testing:
  git status -b -s | grep -Po "main|testing" 

commit-temporary: is-main-or-testing
  git checkout {{testing-branch}} || git checkout -b {{testing-branch}}
  git commit --amend -m "Auto-commit" || echo "No changes to commit..."
  
update KIND:
  nix flake update
  [[ {{KIND}} == "boot" ]] && just rebuild-boot || just rebuild

rebuild-nix KIND: git-add
  sudo nixos-rebuild {{KIND}} --flake .

rebuild-home KIND: git-add
  home-manager {{KIND}} --flake .

rebuild:
  just rebuild-home switch
  just rebuild-nix switch
  just commit-temporary

rebuild-boot:
  just rebuild-home switch
  just rebuild-nix boot
  just commit-temporary

rebuild-only: 
  just rebuild-home build
  just rebuild-nix build

