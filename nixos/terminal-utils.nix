{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    file
    upx
    git
    delta
    git-ignore
    gitleaks
    git-secrets
    pass-git-helper
    just
    # mcfly # terminal history
    zellij
    progress
    noti
    topgrade
    ripgrep
    # skim #fzf better alternative in rust
    monolith
    aria2
    # macchina #neofetch alternative in rust
    sd
    ouch
    duf
    du-dust
    fd
    trash-cli
    zoxide
    tokei
    fzf
    bat
    mdcat
    pandoc
    lsd
    gping
    viu
    yazi
    chafa
    cmatrix
    pipes-rs
    rsclock
    cava
    figlet
  ];
}
