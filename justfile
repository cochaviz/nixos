set shell := ["bash", "-c"]
testing-branch := "testing"

git-add:
  git add .

is-main-or-testing:
  git status -b -s | grep -Po "main|testing" 

commit-temporary: is-main-or-testing
  git checkout {{testing-branch}} || git checkout -b {{testing-branch}}
  git commit --amend -m "Auto-commit" || echo "No changes to commit..."
  
update:
  nix flake update
  just rebuild

rebuild-nix: git-add
  sudo nixos-rebuild switch --flake .

rebuild-home: git-add
  home-manager switch --flake .

rebuild: rebuild-home rebuild-nix commit-temporary
  

