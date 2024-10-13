{ self, pkgs, config, ... }:
{
  imports = [
    ./packages.nix
    ./touch-id.nix
  ];
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    meslo-lgs-nf
  ];

  networking = {
    hostName = "mba";
    computerName = "mba";
  };

  programs = {
    zsh.enable = true;
  };

  users.users.jstaples = {
    name = "jstaples";
    home = "/Users/jstaples";
  };

  nix.package = pkgs.nix;
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.enableSudoTouchId = true;
  services.nix-daemon.enable = true;
  system.stateVersion = 5;
}
