{inputs, pkgs, vars, ...}: {
    
    home.packages = with pkgs; [
      fastfetch
      librewolf
      tree
      wl-gammarelay-rs
      mpvpaper
      wl-clipboard
      htop
    ];
   
   programs.fzf.enable = true;
   programs.fzf.enableZshIntegration = true;
 
    programs.kitty = {
      enable = true;
      font.name = "DejaVuSansMNFM";
      font.size = 12;
      extraConfig = builtins.readFile "${vars.homeDotfiles}/kitty.conf";
      shellIntegration.enableZshIntegration = true;
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      
      shellAliases = {
        update = " sudo nixos-rebuild switch --upgrade --flake /home/hc/.nixos";
      };

      oh-my-zsh = {
        enable = true;
	plugins = ["git" "fzf" ];
        theme = "norm";
      };
      
    };


    programs.waybar = {
      enable = true;
    };

    programs.wofi = {
      enable = true;
    };

    programs.home-manager.enable = true;
}
    
    
    
    
