{ config, ... }:
{
  homebrew = {
    enable = true;
    brews = [
      "gnupg"
      "kompose"
      "kubectl"
    	"mas"
      "pam-reattach"
      "pinentry-mac"
      "pinentry-touchid"
	    "synergy-core"
      "talosctl"
      "virt-manager"
	  ];
	  casks = [
      "alacritty"
    	"discord"
	    "displaylink"
      "docker"
	    "firefox"
      "gimp"
      "gitbutler"
      "google-chrome"
	    "iterm2"
      "itermai"
      "obsidian"
	    "onedrive"
      "secretive"
      "spotify"
      "utm"
      "visual-studio-code"
      "xemu"
    ];
    masApps = {
      "Bitwarden" = 1352778147;
      "Magnet" = 441258766;
      "Microsoft Excel" = 462058435;
      "Microsoft Outlook" = 985367838;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
      "Twingate" = 1501592214;
      "Windows App" = 1295203466;
    };
    taps = [
      "jorgelbg/tap"
      "siderolabs/tap"
    ];
  	onActivation.cleanup = "zap";
  	onActivation.autoUpdate = true;
  	onActivation.upgrade = true;
  };
}

