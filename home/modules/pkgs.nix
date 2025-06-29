{inputs, pkgs, ...}: {
    
    home.packages = with pkgs; [
      fastfetch
      librewolf
      tree
    ];
   
   programs.fzf.enable = true;
   programs.fzf.enableZshIntegration = true;
 
    programs.kitty = {
      enable = true;
      font.name = "DejaVuSansMNFM";
      font.size = 12;
      extraConfig = builtins.readFile ../dotfiles/kitty.conf;
      shellIntegration.enableZshIntegration = true;
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      
      shellAliases = {
        update = "cd /home/hc/.nixos/ && sudo nixos-rebuild switch --upgrade --flake";
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


    programs.home-manager.enable = true;
}
    
    
    
    
