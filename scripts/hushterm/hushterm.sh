# Function to clean mail
clean_mail() {
  if [ -f "/var/mail/$USER" ]; then
    # Safely empty the mail file
    : >"/var/mail/$USER"
  fi
}

# Function to clear last login messages
clear_lastlogin() {
  # Clear the lastlog for current user
  if [ -f ~/.zsh_history ]; then
    # Remove last login entries from shell history
    sed -i.bak '/Last login/d' ~/.zsh_history
  fi
  clear
}

# Function to remove .DS_Store files
remove_ds_store() {
  find . -name ".DS_Store" -type f -delete
}

# Execute all cleanup functions
#clean_mail
clear_lastlogin
#remove_ds_store
