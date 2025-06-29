{config, inputs, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    clinfo
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.dejavu-sans-mono
  ];

  programs.zsh.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
