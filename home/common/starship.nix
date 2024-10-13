{
  add_newline = true;
  format = "[ ](black)$os$username$hostname$directory$git_branch$git_status$c$rust$golang$nodejs$php$java$kotlin$haskell$python$docker_context$conda$character";

  palette = "sholtor_dark";

  palettes.sholtor_dark = {
    colour_bg0 = "#424242";
    colour_fg0 = "#ffffff";
    colour_fg1 = "#E64747";
    colour_ubuntu = "#EB6536";
    colour_ssh = "#43CCEA";
    colour_folder = "#3EC669";
    colour_lblue = "#43CCEA";
    colour_python = "#E4F34A";
    colour_go = "#7FD5EA";
    colour_node = "#42E66C";
    colour_ruby = "#E64747";
    colour_java = "#E64747";
    colour_julia = "#9B6BDF";
    colour_php = "#4063D9";
    colour_blue = "#458588";
    colour_aqua = "#689d6a";
    colour_green = "#98971a";
    colour_orange = "#d65d0e";
    colour_purple = "#b16286";
    colour_red = "#cc241d";
    colour_yellow = "#d79921";
  };

  os = {
    disabled = false;
    style = "bg:black fg:cyan";
    symbols = {
      Alpaquita = " ";
      Alpine = " ";
      AlmaLinux = " ";
      Amazon = " ";
      Android = " ";
      Arch = " ";
      Artix = " ";
      CentOS = " ";
      Debian = " ";
      DragonFly = " ";
      Emscripten = " ";
      EndeavourOS = " ";
      Fedora = " ";
      FreeBSD = " ";
      Garuda = "󰛓 ";
      Gentoo = " ";
      HardenedBSD = "󰞌 ";
      Illumos = "󰈸 ";
      Kali = " ";
      Linux = " ";
      Mabox = " ";
      Macos = " ";
      Manjaro = " ";
      Mariner = " ";
      MidnightBSD = " ";
      Mint = " ";
      NetBSD = " ";
      NixOS = " ";
      OpenBSD = "󰈺 ";
      openSUSE = " ";
      OracleLinux = "󰌷 ";
      Pop = " ";
      Raspbian = " ";
      Redhat = " ";
      RedHatEnterprise = " ";
      RockyLinux = " ";
      Redox = "󰀘 ";
      Solus = "󰠳 ";
      SUSE = " ";
      Ubuntu = " ";
      Unknown = " ";
      Void = " ";
      Windows = "󰍲 ";
    };
  };

  username = {
    show_always = true;
    style_user = "bg:black fg:cyan bold";
    style_root = "bg:black fg:colour_fg1 bold";
    format = "[ $user]($style)";
  };

  hostname = {
    ssh_only = false;
    ssh_symbol = ":🌐";
    trim_at = ".";
    format = "[@$hostname$ssh_symbol]($style)";
    style = "bg:black fg:cyan";
  };

  directory = {
    format = "[:$path]($style)";
    style = "bg:black fg:green";
    home_symbol = "~";
    truncate_to_repo = false;
    use_os_path_sep = true;
  };

  git_branch = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol $branch ](fg:cyan bg:black)]($style)";
  };

  git_status = {
    style = "bg:black";
    format = "[[($all_status$ahead_behind )](fg:cyan bg:black)]($style)";
  };

  nodejs = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_node bg:black)]($style)";
  };

  c = {
    symbol = " ";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_blue bg:black)]($style)";
  };

  rust = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_blue bg:black)]($style)";
  };

  golang = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_go bg:black)]($style)";
  };

  php = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_php bg:black)]($style)";
  };

  java = {
    symbol = " ";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_java bg:black)]($style)";
  };

  kotlin = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_blue bg:black)]($style)";
  };

  haskell = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_blue bg:black)]($style)";
  };

  python = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol( $version) ](fg:colour_python bg:black)]($style)";
  };

  docker_context = {
    symbol = "";
    style = "bg:black";
    format = "[[ $symbol( $context) ](fg:#83a598 bg:black)]($style)";
  };

  conda = {
    style = "bg:black";
    format = "[[ $symbol( $environment) ](fg:#83a598 bg:black)]($style)";
  };

  character = {
    disabled = false;
    success_symbol = "[ ❯](bg:black fg:green)[](fg:black)";
    error_symbol = "[ ❯](bg:black fg:red)[](fg:black)";
    vimcmd_symbol = "[ ❮](bg:black fg:green)[](fg:black)";
    vimcmd_replace_one_symbol = "[ ❮](bg:black fg:purple)[](fg:black)";
    vimcmd_replace_symbol = "[ ❮](bg:black fg:purple)[](fg:black)";
    vimcmd_visual_symbol = "[ ❮](bg:black fg:yellow)[](fg:black)";
  };
}
