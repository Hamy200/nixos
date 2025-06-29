

{ config, pkgs, inputs, ...}:

{
  home.username = "hc";
  home.homeDirectory = "/home/hc";
  home.stateVersion = "25.05";

  imports = [
    ./modules/pkgs.nix 
  ];

}
