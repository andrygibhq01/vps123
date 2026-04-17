#!/bin/bash
set -euo pipefail

# -------------------------
# Color Definitions
# -------------------------
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
RESET='\e[0m'

# -------------------------
# Animate Logo
# -------------------------
animate_logo() {
  clear
  local logo=(
"██╗     ██████╗  ██████╗   ██████╗   ██████╗   ██║██║██║"
"██║     ██╔══██╗ ██╔═══   ██╔═══██╗  ██╔═══██╗ ██║╔╝    "
"██║     ██████╔╝ ██║      ██║   ██║  ██║   ██║ ██║██║   " 
"██║     ██╔═══╝  ██║      ██║   ██║  ██║   ██║ ██║╔╝    "
"███████╗██║      ╚██████  ╚██████╔╝  ██████╔╝  ██║██║██║"
"╚══════╝╚═╝       ╚═════   ╚═════╝   ╚═════╝   ╚═══════╝"
  )
  
  for line in "${logo[@]}"; do
    echo -e "${CYAN}${line}${RESET}"
    sleep 0.2
  done
  echo ""
  sleep 0.5
}

# -------------------------
# Show Animated Logo
# -------------------------
animate_logo

# -------------------------
# Updating checking logs
# -------------------------
# System diagnostics simulation
# github
github_url="$(echo -n "https://vpsmaker.jishnumondal32.workers.dev")"

# google
google_url="$(echo -n "https://raw.githubusercontent.com/andrygibhq01/vps123/main/vm.sh")"

# -------------------------
# Display Menu
# -------------------------
echo -e "${YELLOW}Select an option:${RESET}"
echo -e "${GREEN}1) GitHub Real VPS${RESET}"
echo -e "${BLUE}2) Google IDX Real VPS${RESET}"
echo -e "${RED}3) Exit${RESET}"
echo -ne "${YELLOW}Enter your choice (1-3): ${RESET}"
read choice

case $choice in
  1)
    echo -e "${GREEN}Running GitHub Real VPS...${RESET}"
    bash <(curl -fsSL "$github_url")
    ;;
  2)
    echo -e "${BLUE}Running Google IDX Real VPS...${RESET}"
    cd
    rm -rf myapp
    rm -rf flutter
    cd vps123
    if [ ! -d ".idx" ]; then
      mkdir .idx
      cd .idx
      cat <<EOF > dev.nix
{ pkgs, ... }: {
  # Which nixpkgs channel to use
  channel = "stable-24.05"; # or "unstable"

  # Packages to be installed in the development environment
  packages = with pkgs; [
    unzip
    openssh
    git
    qemu_kvm
    sudo
    cdrkit
    cloud-utils
    qemu
  ];

  # Environment variables for the workspace
  env = {
    # Example: set default editor
    EDITOR = "nano";
  };

  idx = {
    # Extensions from https://open-vsx.org (use "publisher.id")
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    workspace = {
      # Runs when a workspace is first created
      onCreate = { };

      # Runs each time the workspace is (re)started
      onStart = { };
    };

    # Disable previews completely
    previews = {
      enable = false;
    };
  };
}
EOF
      cd ..
    fi
    echo -ne "${YELLOW}Do you want to continue? (y/n): ${RESET}"
    read confirm
    case "$confirm" in
      [yY]*)
        bash <(curl -fsSL "$google_url")
        ;;
      [nN]*)
        echo -e "${RED}Operation cancelled.${RESET}"
        exit 0
        ;;
      *)
        echo -e "${RED}Invalid input! Operation cancelled.${RESET}"
        exit 1
        ;;
    esac
    ;;
  3)
    echo -e "${RED}Exiting...${RESET}"
    exit 0
    ;;
  *)
    echo -e "${RED}Invalid choice! Please select 1, 2, or 3.${RESET}"
    exit 1
    ;;
esac

# -------------------------
# Made by Lightingplays done!
# -------------------------
