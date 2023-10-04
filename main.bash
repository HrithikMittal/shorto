#!/bin/bash

detect_shell() {
    local shell_name="$(basename "$SHELL")"
    case "$shell_name" in
      "bash")
        config_file="$HOME/.bashrc"
        ;;
      "zsh")
        config_file="$HOME/.zshrc"
        ;;
      *)
        echo "Unsupported shell: $shell_name"
        exit 1
        ;;
    esac
  }
  
  create_alias() {
    local alias_name="$1"
    local command="$2"
  
    echo -e "\nalias $alias_name='$command'" >> "$config_file"
    echo "Alias '$alias_name' created successfully in $config_file"
  }
  
  main() {
    detect_shell
    read -p "Enter alias name: " alias_name
    read -p "Enter command: " command
    create_alias "$alias_name" "$command"
  }
  
  main
  