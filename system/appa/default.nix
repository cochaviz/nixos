{ pkgs, config, ... }:

{
  imports = [ 
    ./hardware-configuration.nix 
  ];

  networking.hostName = "appa";

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
    docker-compose
  ];

  # wired networking
  networking.networkmanager.enable = true;

  # enable graphics
  hardware.graphics.enable = true;

  # load nvidia driver
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    
    # powermanagement is experimental
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # open-source kernel module
    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # nvidia docker passthrough
  hardware.nvidia-container-toolkit.enable = true;
}

