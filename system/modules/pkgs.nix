{config, inputs, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    git
  ];
}
