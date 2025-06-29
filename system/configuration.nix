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

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  fonts.packages = with pkgs;[
   nerd-fonts.jetbrains-mono
   dejavu_fonts
  ];


  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; #to allow for electron rendering
  };

  hardware = {
    graphics.enable = true;
  };

  users.users.hc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}

