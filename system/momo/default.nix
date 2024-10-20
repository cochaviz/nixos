{ pkgs, config, ... }:

{
  imports = [ 
    ./hardware-configuration.nix 
  ];

  networking.hostName = "momo";

  # use grub for multi-os boot
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  environment.systemPackages = with pkgs; [
    discord
    wl-clipboard
  ];

  # wired networking
  networking.networkmanager.enable = true;
}

