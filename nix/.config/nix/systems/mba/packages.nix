{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.bfg-repo-cleaner
    pkgs.bws
    pkgs.curl
    pkgs.dig
    pkgs.eza
    pkgs.fd
    pkgs.fzf
    pkgs.gh
    pkgs.git-filter-repo
    pkgs.go
    pkgs.gnumake
    pkgs.mkalias
    pkgs.netcat
    pkgs.nixfmt-rfc-style
    pkgs.nix-search-cli
    pkgs.nodejs
    pkgs.openssl
    pkgs.python3
    pkgs.ripgrep
    pkgs.ruby
    pkgs.rustup
    pkgs.stow
    pkgs.powershell
    pkgs.tshark
    pkgs.unzip
    pkgs.wget2
    pkgs.whois
    pkgs.zig
    pkgs.zoxide
  ];
}
