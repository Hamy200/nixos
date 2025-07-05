{config, inputs, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    clinfo
    killall
    vulkan-tools
    xorg.libXxf86vm
    looking-glass-client
    qemu
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.dejavu-sans-mono
    noto-fonts-cjk-sans
  ];

  programs.zsh.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.firejail.enable = true;

  programs.java = {
    enable = true;
    package = pkgs.temurin-jre-bin;
  };

  programs.virt-manager.enable = true;

 # i18n.inputMethod = {
   # type = "fcitx5";
   # enable = true;
   # fcitx5.waylandFrontend = true;
    #fcitx5.addons = with pkgs; [
   #   fcitx5-mozc
  #    fcitx5-gtk
 #   ];
#
  #};
}
