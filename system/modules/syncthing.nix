user : {
  services = {
      syncthing = {
	  enable = true;
	  inherit user;
	  dataDir = "/home/${user}/Documents";    # Default folder for new synced folders
	  configDir = "/home/${user}/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
      };
  };
  # 22000 TCP and/or UDP for sync traffic
  # 21027/UDP for discovery
  # source: https://docs.syncthing.net/users/firewall.html
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
