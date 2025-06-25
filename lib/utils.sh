#!/usr/bin/env zsh

OSTYPE="$(uname -s | tr '[:upper:]' '[:lower:]')" 

detect_package_manager() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "brew"
  elif command -v apt >/dev/null 2>&1; then
    echo "apt"
  elif command -v dnf >/dev/null 2>&1; then
    echo "dnf"
  elif command -v pacman >/dev/null 2>&1; then
    echo "pacman"
  elif command -v zypper >/dev/null 2>&1; then
    echo "zypper"
  else
    echo "unknown"
  fi
}

maybe_run() {
  if [[ "$DRY_RUN" == "true" ]]; then
    echo "[Dry Run] Would run: $*"
  else
    eval "$@"
  fi
}

package_exists() {
  local pkg="$1"
  local manager="$2"
  
  case "$manager" in
    brew)   brew search --formula "^${pkg}$" >/dev/null 2>&1 ;;
    apt)    apt-cache show "$pkg" >/dev/null 2>&1 ;;
    dnf)    dnf info "$pkg" >/dev/null 2>&1 ;;
    pacman) pacman -Si "$pkg" >/dev/null 2>&1 ;;
    zypper) zypper info "$pkg" >/dev/null 2>&1 ;;
    *)      return 1 ;;
  esac
}

install() {
  PKG_MANAGER=$(detect_package_manager)
  local final_pkgs=()
  local failed_packages=()
  
  for pkg_spec in "$@"; do
    if [[ "$pkg_spec" == *":"* ]]; then
      # Format: package:alt1:alt2:alt3
      IFS=':' read -ra pkg_names <<< "$pkg_spec"
      local found_pkg=""
      
      for pkg_name in "${pkg_names[@]}"; do
        [[ -z "$pkg_name" ]] && continue
        if package_exists "$pkg_name" "$PKG_MANAGER"; then
          found_pkg="$pkg_name"
          break
        fi
      done
      
      if [[ -n "$found_pkg" ]]; then
        final_pkgs+=("$found_pkg")
      else
        failed_packages+=("${pkg_names[0]} (tried: ${pkg_names[*]})")
      fi
    else
      # Single package name
      if package_exists "$pkg_spec" "$PKG_MANAGER"; then
        final_pkgs+=("$pkg_spec")
      else
        failed_packages+=("$pkg_spec")
      fi
    fi
  done
  
  # Install found packages
  if [[ ${#final_pkgs[@]} -gt 0 ]]; then
    case "$PKG_MANAGER" in
      brew)   maybe_run brew install "${final_pkgs[@]}" ;;
      apt)    maybe_run sudo apt install -y "${final_pkgs[@]}" ;;
      dnf)    maybe_run sudo dnf install -y "${final_pkgs[@]}" ;;
      pacman) maybe_run sudo pacman -S --noconfirm "${final_pkgs[@]}" ;;
      zypper) maybe_run sudo zypper install -y "${final_pkgs[@]}" ;;
      *)
        echo "No supported installer found."
        exit 1
        ;;
    esac
  fi
  
  # Report failed packages
  if [[ ${#failed_packages[@]} -gt 0 ]]; then
    echo ""
    echo "⚠️  Could not find packages for $PKG_MANAGER:"
    for failed in "${failed_packages[@]}"; do
      echo "   - $failed"
    done
    echo ""
  fi
}

check_dependencies() {
	local missing=()
	for cmd in "$@"; do
		if ! command -v "$cmd" >/dev/null 2>&1; then
			missing+=("$cmd")
		fi
	done

	if [[ ${#missing[@]} -gt 0 ]]; then
		echo "Missing dependencies: ${missing[*]}"
		return 1
	fi
}

install_with_fallback() {
	local pkg="$1"
	local fallback_method="$2"

	if ! install "$pkg" 2>/dev/null; then
		echo "Package '$pkg' not found, trying fallback..."
		eval "$fallback_method"
	fi
}

debug() {
  [[ "$DEBUG" == true ]] && echo -e "\033[36m[DEBUG]\033[0m $*"
}
