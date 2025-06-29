{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/services.nix
      ./modules/pkgs.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Belfast";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; #to allow for electron rendering
  };

  hardware = {
    graphics.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}

