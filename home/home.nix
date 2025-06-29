

{ config, pkgs, inputs, ...}:

{
  home.username = "hc";
  home.homeDirectory = "/home/hc";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    FZF_COMPLETION_TRIGGER = ",";
  };

  imports = [
    ./modules/pkgs.nix 
  ];

}
