{config, inputs, vars, lib, ...}:
{
  #Copy Dotfiles to .config
  home.file.".config" = {
    source = "${vars.dotfiles}";
    recursive = true;
    executable = true;
  };  

  #Copy the pictures folder
#  home.file."Pictures" = {
#    source = "${vars.tocopy}/Pictures";
#    recursive = true;
#  };

  home.file.".local/share/fcitx5/themes" = {
    source = "${vars.tocopy}/fcitx5/themes";
    recursive = true;
  };

}
