{inputs, pkgs, ...}: {
    
    home.packages = with pkgs; [
      fastfetch
      home-manager
      firefox
      tree
    ];
    
}
    
    
    
    
