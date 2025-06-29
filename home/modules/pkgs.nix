{inputs, pkgs, ...}: {
    
    home.packages = with pkgs; [
      fastfetch
      firefox
      tree
      fzf
    ];
    
    programs.kitty = {
      enable = true;
      font.name = "JetBrainsMono Nerd Font";
      font.size = 10;
    };
    programs.home-manager.enable = true;
}
    
    
    
    
