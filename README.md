# NixOS Configuration Flake

I'm using the [justfile]() format, use simply do the following if you have `just` installed:

```bash
just rebuild
```

This will execute both the `nixos-rebuild` and `home-manager` commands to
rebuild the whole system and user home folder. If you want to install this
remotely (directly from github.com, without cloning), you probably don't have
`just` and `home-manager` so these will need to be bootstrapped. To do all of
this, just run the following command:

```bash
nix-shell -p home-manager just git --run "just init"
```

Then, you should be done! :smile:
