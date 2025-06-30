{config, pkgs, inputs, ...}:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-dark;
    };

    cursorTheme = {
      name = "Capitaine-Cursors"
      package = pkgs.capitaine-cursors;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      ''
    };
    
    gtk4.extraConfig = {
      Settings = ''                          
        gtk-application-prefer-dark-theme=1
      ''
    };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
};
