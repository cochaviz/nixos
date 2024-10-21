set shell := ["bash", "-c"]
testing-branch := "testing"

git-add:
  git add .

commit-temporary:
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
  

