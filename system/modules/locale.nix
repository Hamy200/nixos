{config, inputs, pkgs, ...}:
{
  time.timeZone = "Europe/Belfast";
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
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

}
