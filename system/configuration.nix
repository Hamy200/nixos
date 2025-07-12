{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/services.nix
      ./modules/pkgs.nix
      ./modules/locale.nix
      ./modules/virtualisation.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;


  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; #to allow for electron rendering
    QT_IM_MODULE="fcitx";  
    XMODIFIERS="@im=fcitx";
    ANKI_WAYLAND="1";
    
  };

  zramSwap = {
    enable = true;
    memoryPercent = 15;
  };

  users.users.hc = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}

