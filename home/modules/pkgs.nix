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
	clean  = "nix-collect-garbage -d";
  	update-flakes = "nix flake update --flake /home/hc/.nixos/";
        hpkgs = "vim /home/hc/.nixos/home/modules/pkgs.nix";
        spkgs = "vim /home/hc/.nixos/system/modules/pkgs.nix";
	
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

    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
     
      fcitx5 = {
        addons = [
          pkgs.fcitx5-mozc
          pkgs.fcitx5-gtk
          pkgs.fcitx5-tokyonight
        ];
        waylandFrontend = true;
        settings.addons = {
          classicui.globalSection.Theme = "Tokyonight-Storm";
        };
        settings.inputMethod = {
          "Groups/0"= {Name="Main"; "Default Layout"="gb"; "DefaultIM"="mozc";};
  	  "Groups/0/Items/0" = {Name="keyboard-gb"; Layout="";};
	  "Groups/0/Items/1" = {Name="mozc"; Layout="";}; 
          GroupOrder={"0"="Main";};
        };
      };


    };   
  
    programs.home-manager.enable = true;
}
    
    
    
    
