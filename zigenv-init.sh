#!/bin/sh

# Function to clone the zigenv repository
clone_zigenv() {
   ZIGENV_REPO="https://github.com/melhindi/zigenv"
   ZIGENV_DIR="$HOME/.zigenv"
   [ ! -d "$ZIGENV_DIR" ] && git clone "$ZIGENV_REPO" "$ZIGENV_DIR"
}

# Function to append zigenv initialization to a file
append_zigenv_init() {
   PROFILE_FILE="$1"
   case "$SHELL" in
   */fish)
      # For Fish shell, use fish_user_paths for PATH update
      echo 'set -gx ZIGENV_ROOT "$HOME/.zigenv"' >>"$PROFILE_FILE"
      echo 'set -gx fish_user_paths "$ZIGENV_ROOT/bin" "$ZIGENV_ROOT/shims" $fish_user_paths' >>"$PROFILE_FILE"
      ;;
   *)
      # For other shells, use the export command
      {
         echo '# Initialize zigenv'
         echo 'ZIGENV_ROOT="$HOME/.zigenv"'
         echo 'PATH="$ZIGENV_ROOT/bin:$ZIGENV_ROOT/shims:$PATH"'
         echo 'export ZIGENV_ROOT PATH'
      } >>"$PROFILE_FILE"
      ;;
   esac
}

# Function to detect the shell and choose the appropriate profile file
choose_profile_file() {
   case "$SHELL" in
   */bash)
      [ -f "$HOME/.bashrc" ] && echo "$HOME/.bashrc" || echo "$HOME/.bash_profile"
      ;;
   */zsh)
      [ -f "$HOME/.zshrc" ] && echo "$HOME/.zshrc" || echo "$HOME/.zprofile"
      ;;
   */fish)
      echo "$HOME/.config/fish/config.fish"
      ;;
   */ksh)
      [ -f "$HOME/.kshrc" ] && echo "$HOME/.kshrc" || echo "$HOME/.profile"
      ;;
   *)
      echo "$HOME/.profile"
      ;;
   esac
}

# Function to source the profile file
source_profile_file() {
   PROFILE_FILE="$1"
   case "$SHELL" in
   */fish)
      # Source config.fish for Fish shell
      fish -c "source $PROFILE_FILE"
      ;;
   *)
      # Source the profile for other shells
      # We cannot source the file directly from a script running in a different process,
      # so we print a message instructing the user to do it manually.
      echo "If required, please run the following command to apply the changes:"
      echo ". \"$PROFILE_FILE\""
      . $PROFILE_FILE
      ;;
   esac
}

# Main function to install zigenv
install_zigenv() {
   clone_zigenv
   PROFILE_FILE=$(choose_profile_file)
   if ! grep -q ZIGENV_ROOT $PROFILE_FILE; then
      append_zigenv_init "$PROFILE_FILE"
   fi
   source_profile_file "$PROFILE_FILE"
   echo "zigenv installed and initialized in $PROFILE_FILE"
}

# Execute the main function
install_zigenv
