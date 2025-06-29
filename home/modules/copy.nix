{config, inputs, vars, ...}:
{
  #Copy Dotfiles to .config
  home.file.".config" = {
    source = "${vars.dotfiles}";
    recursive = true;
    executable = true;
  };  
}
