{config, inputs, vars, ...}:
{
  #Copy Dotfiles to .config
  home.file.".config" = {
    source = "${vars.dotfiles}";
    recursive = true;
    executable = true;
  };  

  #Copy the pictures folder
  home.file."Pictures" = {
    source = "${vars.tocopy}/Pictures";
    recursive = true;
  };
}
