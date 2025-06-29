{inputs, pkgs, ...}: {
    
    home.packages = with pkgs; [
      fastfetch
      librewolf
      tree
      fzf
    ];
    
    programs.kitty = {
      enable = true;
      font.name = "DejaVuSansMNFM";
      font.size = 12;
      extraConfig = builtins.readFile ../dotfiles/kitty.conf;
    };

    programs.waybar = {
      enable = true;
    };


    programs.home-manager.enable = true;
}
    
    
    
    
