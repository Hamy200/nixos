


{ config, pkgs, inputs, vars, ...}:

{
  home.username = "hc";
  home.homeDirectory = "/home/hc";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    FZF_COMPLETION_TRIGGER = ",";
  };
  
  imports = [
    "${vars.homeModules}/pkgs.nix"
    "${vars.homeModules}/services.nix"
    "${vars.homeModules}/copy.nix"
    "${vars.homeModules}/desktop.nix"
  ];

}
