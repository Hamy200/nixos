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
      anki-bin
      wineWowPackages.stable
      pavucontrol
      winetricks
      glxinfo
      mpv
      marktext
      unar
      tesseract
      qbittorrent
      lutris
      protonup-qt
      (python313.withPackages (
  	ps: with ps; [
	  pip
	]
      ))
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
        up = " sudo nixos-rebuild switch --upgrade --flake /home/hc/.nixos";
	clean  = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
	gc-store-clean = "nix-store --gc";
  	update-flakes = "nix flake update --flake /home/hc/.nixos/";
        hpkgs = "nvim /home/hc/.nixos/home/modules/pkgs.nix";
        spkgs = "nvim /home/hc/.nixos/system/modules/pkgs.nix";
	analyse-store = "sudo nix-shell -p ncdu --command 'ncdu /nix'";
	
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
    
      plugins = {
        mount = pkgs.yaziPlugins.mount;
      };
 
      keymap = {
        mgr.prepend_keymap = [
	  {
	    on = ["<M>"];
	    run = "plugin mount";
	  }
	];
      };
    };


    programs.neovim = {
      enable = true;
      extraConfig = 
      ''
	set clipboard+=unnamedplus

      '';
    };
  
    programs.home-manager.enable = true;
}
    
    
    
    
