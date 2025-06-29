{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/services.nix
      ./modules/pkgs.nix
      ./modules/locale.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; #to allow for electron rendering
  };

  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };

  users.users.hc = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}

