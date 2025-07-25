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
    ydotool
    liquidctl
    vdpauinfo
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    openvpn
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
  

}
