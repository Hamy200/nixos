{inputs, pkgs, vars, ...}: {
    
    home.packages = with pkgs; [
      fastfetch
      tree
      wl-gammarelay-rs
      mpvpaper
      wl-clipboard
      htop
      hyprshot
      hyprcursor
      nwg-look
      p7zip
      capitaine-cursors
      gruvbox-plus-icons
      nemo
      hyprsunset
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

    programs.librewolf = {
      enable = true;
      settings = {
        "ui.systemUsesDarkTheme" = 1;
      };
    };

    programs.waybar = {
      enable = true;
    };

    programs.wofi = {
      enable = true;
    };

    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      flavors = {
        kanagawa-yazi = "${vars.homeModules}/kanagawa-yazi";
      }; 

      theme = {
        flavour = {
        dark = "kanagawa-yazi";
        };
      };
    };


    programs.home-manager.enable = true;
}
    
    
    
    
